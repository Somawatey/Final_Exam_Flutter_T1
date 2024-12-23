import 'package:final_exam/1-STARTCODE/models/course.dart';
import 'package:final_exam/1-STARTCODE/widgets/courses_view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
    final courses = [
      Course(
        name: 'HTML',
        studentScores: [
          StudentScore(name: 'Ronan the best', score: 100),
          StudentScore(name: 'Vichea Cry', score: 40),
          StudentScore(name: 'Sokea Amazon', score: 90),
        ],
      ),
      Course(
        name: 'Java',
        studentScores: [],
      ),
      Course(
        name: 'Python',
        studentScores: [
          StudentScore(name: 'Ronan the best', score: 100),
          StudentScore(name: 'Vichea Cry', score: 40),
          StudentScore(name: 'Sokea Amazon', score: 90),
        ],
      ),
    ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoursesView(courses: courses),
      );
  }
}
