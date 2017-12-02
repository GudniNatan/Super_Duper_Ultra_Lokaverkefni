from models import Semesters, Students, Studentcourses, Courses
from django.core.exceptions import ObjectDoesNotExist

def getSelectedCoursesBySemester(student, semester):
    courseList = list()
    courses = Studentcourses.objects.filter(studentid=student.studentid, semestertaken=semester.semesterid)

    for c in courses:
        courseList.append(Courses.objects.get(trackcourses=c.trackcourseid))

    return courseList

def getSemesters(userName):
    finalData = list()

    student = Students.objects.get(username=userName)
    semesters = Semesters.objects.all()

    for semester in semesters:
        finalData.append((semester.semestername, getSelectedCoursesBySemester(student, semester)))
    return finalData

def getTrimmedSemesters(userName, getIndex=None):
    data = getSemesters(userName)
    startIndex = -1
    finalIndex = 0
    for semester in data:
        if semester[1]:
            if startIndex == -1:
                startIndex = data.index(semester)
            finalIndex = data.index(semester)
    if finalIndex < len(data) - 1:
        finalIndex += 1
    if getIndex == "last":
        return finalIndex
    elif getIndex == "first":
        return startIndex
    return data[startIndex:finalIndex+1]

def getFinalRegisteredSemesterIndex(userName):
    return getTrimmedSemesters(userName, "last") + 1