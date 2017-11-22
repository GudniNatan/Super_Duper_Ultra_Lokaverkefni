from django.shortcuts import render
from django.shortcuts import get_object_or_404
from .forms import LoginForm, RegisterForm
from datetime import date
from passwordValidation import boil, verify, updatePass
from .models import Courses
from django.db import connections
from django.db import IntegrityError

# Create your views here.
def index(request):
    path = 'lokaverkefni/index.html'
    #path = os.path.join(os.path.dirname(__file__), '/templates/' + 'lokaverkefni/index.html')
    yes = request.session.get("kt") or ""
    loginformErrors, registerformErrors = None, None


    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        if "sendlogin" in request.POST:
            loginform = LoginForm(request.POST)
            # check whether it's valid:
            if loginform.is_valid():
                #render different page if login is good
                yes += str(login(request, loginform.cleaned_data['login_username'], loginform.cleaned_data['login_password']))

            else:
                loginformErrors = loginform.errors.as_data()

        if "sendregister" in request.POST:
            registerform = RegisterForm(request.POST)
            if registerform.is_valid():
                #render different page if register is good
                yes += str(register(request, registerform.cleaned_data['register_username'], registerform.cleaned_data['register_password']))

            else:
                registerformErrors = registerform.errors.as_data()

    context = {
        "year":date.today().year,
        "postData": yes,
        'current_path': request.get_full_path(),
        'loginError': loginformErrors,
        'registerError': registerformErrors,
    }
    return render(request, path, context)

def chart(request):
    path = 'lokaverkefni/chart.html'
    with connections['mysql'].cursor() as cursor:
        cursor.execute("SELECT courseJSON()")
        row = cursor.fetchone()
    context = {
        "year": date.today().year,
        "data": u"%s" % (row[0]),
        'current_path': request.get_full_path(),
    }
    return render(request, path, context)

def nextSemester(request):
    path = 'lokaverkefni/nextSemester.html'
    context = {
        "year": date.today().year,
        'current_path': request.get_full_path(),
    }
    return render(request, path, context)


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

    with connections['mysql'].cursor() as cursor:
        cursor.execute("SELECT getPass('%s')" % kennitala)
        encryptedPass = cursor.fetchone()[0]
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