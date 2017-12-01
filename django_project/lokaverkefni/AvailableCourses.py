from django.db.models import Sum
from models import Students, Studentcourses, Courses, Restrictors


#Do you have enough credits in this courses division to take it?
def creditsMet(course, userName, completedCourses):
    divisionCourses = completedCourses.filter(divisionid=course.divisionid)
    count = divisionCourses.aggregate(Sum('coursecredits'))
    return (course.mincredits == 0) or (course.mincredits >= count)

#returns boolean signifying if all prerequesites have been met
def isCourseAvaiable(course, userName, completedCourses=None):
    if completedCourses is None:
        student = Students.objects.get(username=userName)
        completedCourses = Courses.objects.filter(trackcourses__studentcourses__studentid=student)

    if not creditsMet(course, userName, completedCourses):
        return False

    prerequesites = Restrictors.objects.filter(coursenumber=course)
    for restrictor in prerequesites:
        if completedCourses.filter(coursenumber=restrictor.restrictorid_id).count() == 0:
            return False
    return True

# Returns all available courses for next semester
def get(userName):
    student = Students.objects.get(username=userName)
    completedCourses = Courses.objects.filter(trackcourses__studentcourses__studentid=student)
    uncompletedCourses = Courses.objects.exclude(trackcourses__studentcourses__studentid=student).filter(trackcourses__trackid=student.studenttrack_id)
    availableCourses = list()

    for course in uncompletedCourses:
        if isCourseAvaiable(course, userName, completedCourses):
            availableCourses.append(course)
    return availableCourses