import 'package:final_exam/1-STARTCODE/models/course.dart';
import 'package:final_exam/1-STARTCODE/widgets/courses_view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
    final courses = [
      Course(
        name: 'Math',
        studentScores: [
          StudentScore(name: 'Alice', score: 85.0),
          StudentScore(name: 'Bob', score: 78.0),
          StudentScore(name: 'Charlie', score: 92.0),
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
 
      home: Scaffold(
        appBar: AppBar(title: const Text('Score App')
        ),
        body: CoursesView(courses: courses),
      ),
      
    );
  }
}
