class Course {
  String id;
  String instructorId;
  String name;
  String description;
  String startTime;
  String endTime;
  int week;

  Course(
      {required this.id,
        required this.instructorId,
        required this.name,
        required this.description,
        required this.startTime,
        required this.endTime,
        required this.week});
}

class Instructor {
  String id;
  String name;
  String imageUrl;
  String type;

  Instructor({required this.id, required this.name, required this.imageUrl, required this.type});
}

class CourseRepository {
  List<Course> _courses = [];
  List<Instructor> _instructors = [];

  // 在實務上，會在此階段向資料庫或是本地資料庫取得初始資料。
  // CourseRepository() {
  //   _fetchCourses();
  //   _fetchInstructors();
  // }

  // 課程列表 (Read)
  List<Course> getCourses() {
    return _courses;
  }

  // 授課講師列表 (Read)
  List<Instructor> getInstructors() {
    return _instructors;
  }

  // 授課講師所開課程列表 (Read)
  List<Course> getCoursesByInstructor(String instructorId) {
    return _courses.where((course) => course.instructorId == instructorId).toList();
  }

  // 建立新講師 (Create)
  void createInstructor(Instructor instructor) {
    _instructors.add(instructor);
  }

  // 建立新課程 (Create)
  void createCourse(Course course) {
    _courses.add(course);
  }

  // 更新課程內容 (Update)
  void updateCourseContent(String courseId, String newDescription) {
    var courseIndex = _courses.indexWhere((course) => course.id == courseId);
    if (courseIndex != -1) {
      _courses[courseIndex].description = newDescription;
    }
  }

  // 刪除課程 (Delete)
  void deleteCourse(String courseId) {
    _courses.removeWhere((course) => course.id == courseId);
  }
}
