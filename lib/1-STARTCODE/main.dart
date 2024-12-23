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
        name: 'Math',
        studentScores: [
          StudentScore(name: 'kiki', score: 85.0),
          StudentScore(name: 'mimi', score: 10.0),
          StudentScore(name: 'tt', score: 92.0),
        ],
      ),
      Course(
        name: 'Science',
        studentScores: [],
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
