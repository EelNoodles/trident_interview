import 'package:flutter_test/flutter_test.dart';
import 'package:interview_trident/repository.dart';

void main() {
  // 測試 createCourse 可以正確創建課程
  group('CourseRepository Test', () {
    test('should create a course successfully', () {
      var repository = CourseRepository();
      var course = Course(
          id: "1",
          instructorId: "1",
          name: "基礎程式設計",
          description: "",
          startTime: "10:00",
          endTime: "12:00",
          week: 2);

      repository.createCourse(course);

      var courses = repository.getCourses();
      expect(courses, contains(course));
    });
  });

  // 測試可以正確依照講師id來尋找講師的所有課程
  group('CourseRepository Test', () {
    test('should retrieve courses by instructor ID', () {
      var repository = CourseRepository();
      var course1 = Course(
          id: "1",
          instructorId: "1",
          name: "基礎程式設計",
          description: "",
          startTime: "10:00",
          endTime: "12:00",
          week: 2);

      var course2 = Course(
          id: "2",
          instructorId: "2",
          name: "人工智慧總整與實作",
          description: "",
          startTime: "14:00",
          endTime: "16:00",
          week: 4);

      var course3 = Course(
          id: "3",
          instructorId: "1",
          name: "訊號與系統",
          description: "",
          startTime: "10:00",
          endTime: "12:00",
          week: 5);

      repository.createCourse(course1);
      repository.createCourse(course2);
      repository.createCourse(course3);

      var instructorCourses = repository.getCoursesByInstructor('1');

      // Assert
      expect(instructorCourses.length, 2);
      expect(instructorCourses, containsAll([course1, course3]));
    });
  });

  // 測試可以正確刪除課程
  group('CourseRepository Test', () {
    test('should delete a course successfully', () {
      var repository = CourseRepository();
      var course = Course(
          id: "1",
          instructorId: "1",
          name: "基礎程式設計",
          description: "",
          startTime: "10:00",
          endTime: "12:00",
          week: 2);

      repository.createCourse(course);

      repository.deleteCourse('1');

      var courses = repository.getCourses();
      expect(courses, isNot(contains(course)));
    });
  });
}
