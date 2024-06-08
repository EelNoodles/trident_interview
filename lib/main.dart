import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Course {
  final String id;
  final String instructorId;
  final String name;
  final String description;
  final String startTime;
  final String endTime;
  final int week;

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
  final String id;
  final String name;
  final String imageUrl;
  final String type;

  Instructor({required this.id, required this.name, required this.imageUrl, required this.type});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Instructor> _instructors;
  late List<Course> _courses;
  late List<bool> isExpended;

  @override
  void initState() {
    super.initState();
    _instructors = [
      Instructor(id: "1", name: "Albert Flores", imageUrl: "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg", type: "Demonstrator"),
      Instructor(id: "2", name: "Floyd Miles", imageUrl: "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg", type: "Lecturer"),
      Instructor(id: "3", name: "Savannah Nguyen", imageUrl: "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg", type: "Senior Lecturer"),
      Instructor(id: "4", name: "Jenny Wilson", imageUrl: "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg", type: "Professor"),
      Instructor(id: "5", name: "Floyd Miles", imageUrl: "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg", type: "Demonstrator"),
    ];
    _courses = [
      Course(id: "1",
          instructorId: "1",
          name: "基礎程式設計",
          description: "",
          startTime: "10:00",
          endTime: "12:00",
          week: 2),
      Course(id: "2",
          instructorId: "1",
          name: "人工智慧總整與實作",
          description: "",
          startTime: "14:00",
          endTime: "16:00",
          week: 4),
      Course(id: "3",
          instructorId: "1",
          name: "訊號與系統",
          description: "",
          startTime: "10:00",
          endTime: "12:00",
          week: 5),
    ];
    isExpended = List.generate(_instructors.length, (int index)=> false);
  }

  @override
  Widget build(BuildContext context) {
    final weekInZh = ['一', "二", "三", "四", "五", "六", "日"];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text("講師清單", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _instructors.length,
          itemBuilder: (context, index) {
            var instructor = _instructors[index];
            List<Course> courses = _courses.where((course) => course.instructorId == instructor.id).toList();
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ExpansionTile(
                  collapsedShape: const RoundedRectangleBorder(
                      borderRadius: (BorderRadius.all(Radius.circular(5))),
                      side: BorderSide(
                          width: 1
                      )
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: (BorderRadius.all(Radius.circular(5))),
                      side: BorderSide(
                          width: 2
                      )
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(instructor.imageUrl),
                  ),
                  title: Text(instructor.type, style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  )),
                  subtitle: Text(instructor.name, style: const TextStyle(
                      fontSize: 16
                  )),
                  trailing: Icon(isExpended[index] ? Icons.remove:Icons.add, size: 25),
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpended[index] = value;
                    });
                  },
                  children: [
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        var course = courses[index];
                        return ListTile(
                          leading: const Icon(Icons.calendar_month_rounded),
                          title: Text(course.name),
                          subtitle: Text("每週${weekInZh[course.week]}, ${course.startTime}~${course.endTime}"),
                          trailing: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
                          ),
                        );
                      },
                    ),
                  ]
              ),
            );
          },
        )
      )
    );
  }
}
