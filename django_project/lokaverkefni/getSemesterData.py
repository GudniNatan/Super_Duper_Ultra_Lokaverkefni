from models import Semesters, Students, Studentcourses, Courses
from django.core.exceptions import ObjectDoesNotExist

def getSelectedCoursesBySemester(student, semester):
    courseList = list()
    courses = Studentcourses.objects.filter(studentid=student.studentid, semestertaken=semester.semesterid)

    for c in courses:
        courseList.append(Courses.objects.get(coursenumber=c.coursenumber_id))

    return courseList

def getSemesters(userName):
    finalData = list()

    student = Students.objects.get(username=userName)
    semesters = Semesters.objects.all()

    for semester in semesters:
        finalData.append((semester.semestername, getSelectedCoursesBySemester(student, semester)))
    return finalData