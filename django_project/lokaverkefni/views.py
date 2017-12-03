#!/usr/local/bin/python
#coding: utf-8

from django.shortcuts import render, get_object_or_404, get_list_or_404, redirect
from django.http import Http404
from .forms import LoginForm, RegisterForm, CourseSubmitForm
from datetime import date
from passwordValidation import boil, verify, updatePass
from .models import Courses, Tracks, Students, Semesters, Trackcourses, Studentcourses
from django.db import connections, IntegrityError
from django.core.exceptions import ObjectDoesNotExist
from django.utils.encoding import smart_unicode
from django.contrib.auth import logout
from getSemesterData import getSemesters, getTrimmedSemesters, getFinalRegisteredSemesterIndex
import AvailableCourses

# Create your views here.
def index(request):
    # Index page
    path = 'lokaverkefni/index.html'
    loginformErrors, registerformErrors = list(), list()
    post = False
    tracks = list()
    for obj in get_list_or_404(Tracks.objects.all()):
        tracks.append([smart_unicode(obj.trackid), smart_unicode(obj.trackname)])
    tracks.reverse()

    if request.method == 'POST':
        post = ("sendlogin" in request.POST) or ("sendregister" in request.POST)
        # create a form instance and populate it with data from the request:
        if "sendlogin" in request.POST:
            loginform = LoginForm(request.POST)
            # check whether it's valid:
            if loginform.is_valid():
                #render different page if login is good
                data = loginform.cleaned_data
                validLogin = login(request, data['login_username'], data['login_password'])
                if not validLogin:
                    loginformErrors.append(smart_unicode(u"Kennitala/Lykilorð rangt slegið inn"))

            else:
                for key in loginform.errors.as_data():
                    for err in loginform.errors.as_data()[key]:
                        loginformErrors.append(err[0])

        if "sendregister" in request.POST:
            registerform = RegisterForm(request.POST)
            if registerform.is_valid():
                #render different page if register is good
                data = registerform.cleaned_data
                validRegister = register(request, data['register_username'], data['register_password'], data['track_id'])
                if not validRegister:
                    registerformErrors.append(smart_unicode(u"Kennitala upptekin"))

            else:
                for key in registerform.errors.as_data():
                    for err in registerform.errors.as_data()[key]:
                        registerformErrors.append(err[0])
    # Get username from session
    userName = request.session.get("kt")
    semesterData = None
    if userName:
        semesterData = getTrimmedSemesters(userName)

    # This is the data passed on to the template
    context = {
        "year":date.today().year,
        "userName": userName,
        "post": post,
        'current_path': request.get_full_path(),
        'loginError': loginformErrors,
        'registerError': registerformErrors,
        'tracks': tracks,
        'semesterData':semesterData,
    }

    #Render the page
    return render(request, path, context)

def chart(request):
    # The /chart/ page
    path = 'lokaverkefni/chart.html'

    # Get username from session
    userName = request.session.get("kt")

    if userName and request.method == 'POST' and "courses[]" in request.POST:
        addStudentCourses(request, userName)

    #This code gets the JSON data from the database using raw sql
    with connections['mysql'].cursor() as cursor:
        if userName:
            cursor.execute("SELECT courseJSONByStudent('%s')" % userName)
        else:
            cursor.execute("SELECT courseJSON()")
        row = cursor.fetchone()

    context = {
        "year": date.today().year,
        "data": u"%s" % (row[0]),
        'current_path': request.get_full_path(),
        "userName": userName,
    }
    return render(request, path, context)

def about(request):
    # The /about/ page
    path = 'lokaverkefni/about.html'
    userName = request.session.get("kt")
    context = {
        "year": date.today().year,
        'current_path': request.get_full_path(),
        "userName": userName,
    }
    return render(request, path, context)


def nextSemester(request):
    # The /nextSemester/ page
    path = 'lokaverkefni/nextSemester.html'
    userName = request.session.get("kt")
    courseData, nextsem, nextsem_id = None, None, None

    # If courses have been submitted, validate them and add them to StudentCourses
    if userName and request.method == 'POST' and "courses[]" in request.POST:
        addStudentCourses(request, userName)

    if userName:
        courseData = AvailableCourses.get(userName)
        nextsem = Semesters.objects.get(semesterid=getFinalRegisteredSemesterIndex(userName))
        nextsem_id = nextsem.semestername
    else:
        pass
        # get available courses for all tracks
        courseData = AvailableCourses.getAllNoRestrictors()
        # nextsem should be literally the next semester in real time
        for sem in Semesters.objects.all():
            if sem.semesterstarts > date.today():
                nextsem = sem
                nextsem_id = nextsem.semestername
                break
        else:
            nextsem = Semesters.objects.get(semesterid=1)
            nextsem_id = nextsem.semestername

    context = {
        "year": date.today().year,
        'current_path': request.get_full_path(),
        "userName": userName,
        "courseData": courseData,
        "nextsem": nextsem_id,
    }
    return render(request, path, context)

def delete_view(request, semesterName):
    # Simple page to delete courses from StudentCourses, redeirects back to index
    delsem = get_object_or_404(Semesters, semestername=semesterName)
    userName = request.session.get("kt")
    if not userName:
        raise Http404(u"Innskráning er nauðsynleg til að eyða.")

    student = Students.objects.get(username=userName)
    scs = Studentcourses.objects.filter(studentid=student)

    for sem in Semesters.objects.all():
        if sem.semesterstarts < delsem.semesterstarts:
            scs = scs.exclude(semestertaken=sem)

    scs.delete()

    return redirect('../../')


def logout_view(request):
    # Logout page uses included Django logout function and redirects to index page
    logout(request)
    return redirect('/')


def register(request, kennitala, password, track=9):
    # encrypt password
    encryptedPass = boil(password)
    try:
        with connections['mysql'].cursor() as cursor:
            cursor.execute("CALL newStudent('%s', '%s', %i)" % (kennitala, encryptedPass, track))
    except IntegrityError:
        return False
    login(request, kennitala, password)

def login(request, kennitala, password):
    try:
        encryptedPass = Students.objects.get(username=kennitala).userpassword
    except ObjectDoesNotExist:
        return False
    #with connections['mysql'].cursor() as cursor:
    #    cursor.execute("SELECT getPass('%s')" % kennitala)
    #    encryptedPass = cursor.fetchone()[0]
    try:
        if not verify(password, encryptedPass):
            return False
    except TypeError:
        return False

    request.session['kt'] = kennitala

    newPass = updatePass(encryptedPass)

    with connections['mysql'].cursor() as cursor:
        cursor.execute("CALL updatePass('%s', '%s')" % (kennitala, newPass))

    return True

def addStudentCourses(request, userName):
    # Validate submitted courses and add them to the StudentCourses table
    einingar = 0
    maxEiningar = 35

    courseData = AvailableCourses.get(userName)
    nextsem = Semesters.objects.get(semesterid=getFinalRegisteredSemesterIndex(userName))

    # Get selected courses
    cdID = list()
    for c in courseData:
        cdID.append((c.coursenumber, c.coursenumber))
    courseIDS = request.POST.getlist('courses[]', False)

    # Make sure all the selected courses are legal
    selectedCourses = list()
    legal = True
    for cID in courseIDS:
        c = [item for item in courseData if item.coursenumber == cID]
        if not c:
            legal = False
            break
        einingar += c[0].coursecredits
        selectedCourses.append(c[0])
    if legal and einingar <= maxEiningar:

        # need to get student & track
        student = Students.objects.get(username=userName)
        track = Tracks.objects.get(trackid=student.studenttrack_id)

        # Add them to the database on the next semester.
        scs = list()
        for course in selectedCourses:
            trackCourse = Trackcourses.objects.get(coursenumber=course.coursenumber, trackid=track.trackid)
            scs.append(Studentcourses(trackcourseid=trackCourse, studentid=student, semestertaken=nextsem))
            pass
        Studentcourses.objects.bulk_create(scs)