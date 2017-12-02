#!/usr/local/bin/python
#coding: utf-8

from django.shortcuts import render, get_object_or_404, get_list_or_404, redirect
from .forms import LoginForm, RegisterForm, CourseSubmitForm
from datetime import date
from passwordValidation import boil, verify, updatePass
from .models import Courses, Tracks, Students, Semesters
from django.db import connections
from django.db import IntegrityError
from django.core.exceptions import ObjectDoesNotExist
from django.utils.encoding import smart_unicode
from django.contrib.auth import logout
from getSemesterData import getSemesters, getTrimmedSemesters, getFinalRegisteredSemesterIndex
import AvailableCourses

# Create your views here.
def index(request):
    path = 'lokaverkefni/index.html'
    #path = os.path.join(os.path.dirname(__file__), '/templates/' + 'lokaverkefni/index.html')
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
                #loginformErrors = loginform.errors.as_data()
                for err in loginform.errors.as_data()["__all__"]:
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
                #registerformErrors = registerform.errors.as_data()
                for key in registerform.errors.as_data():
                    for err in registerform.errors.as_data()[key]:
                        registerformErrors.append(err[0])

    userName = request.session.get("kt")
    semesterData = None
    if userName:
        semesterData = getTrimmedSemesters(userName)

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
    return render(request, path, context)

def chart(request):
    path = 'lokaverkefni/chart.html'
    userName = request.session.get("kt")
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
    path = 'lokaverkefni/about.html'
    userName = request.session.get("kt")
    context = {
        "year": date.today().year,
        'current_path': request.get_full_path(),
        "userName": userName,
    }
    return render(request, path, context)


def nextSemester(request):
    path = 'lokaverkefni/nextSemester.html'
    userName = request.session.get("kt")
    courseData = AvailableCourses.get(userName)
    nextsem = Semesters.objects.get(semesterid=getFinalRegisteredSemesterIndex(userName))
    nextsem_id = nextsem.semestername

    if request.method == 'POST':
        # Make sure all the selected courses are legal
        cdID = list()
        for c in courseData:
            cdID.append((c.coursenumber, c.coursenumber))
        courses = CourseSubmitForm(request.POST)
        raise Exception(courses)

        # Add them to the database on the next semester.
        pass

    context = {
        "year": date.today().year,
        'current_path': request.get_full_path(),
        "userName": userName,
        "courseData": courseData,
        "nextsem": nextsem_id,
    }
    return render(request, path, context)

def logout_view(request):
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