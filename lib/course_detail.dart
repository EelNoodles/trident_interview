import 'package:flutter/material.dart';
import 'package:interview_trident/main.dart';

class CourseDetail extends StatelessWidget {
  final Course courseData;
  const CourseDetail({super.key, required this.courseData});

  @override
  Widget build(BuildContext context) {
    final weekInZh = ['一', "二", "三", "四", "五", "六", "日"];
    return Scaffold(
      appBar: AppBar(
        title: Text(courseData.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  child: const Text("課程時間", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                Text("每週${weekInZh[courseData.week]}, ${courseData.startTime}~${courseData.endTime}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  child: const Text("課程簡介", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(courseData.description, softWrap: true),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
