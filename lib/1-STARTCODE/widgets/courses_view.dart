import 'package:final_exam/1-STARTCODE/models/course.dart';
import 'package:final_exam/1-STARTCODE/widgets/course_view.dart';
import 'package:flutter/material.dart';

class CoursesView extends StatefulWidget {
  final List<Course> courses;
  const CoursesView({super.key, required this.courses});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score App'),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemCount: widget.courses.length,
        itemBuilder: (context, index) {
          final course = widget.courses[index];
          final scoreCount = course.studentScores.length;
          final averageScore = scoreCount > 0
              ? course.studentScores
                      .map((e) => e.score) 
                      .reduce((a, b) => a + b) /    
                  scoreCount
              : 0.0;

          return Card(
            margin: const EdgeInsets.all(8),
            child: SizedBox(
              height: 75,
              child: ListTile(
              title: Text(course.name),
              subtitle: Text(scoreCount > 0
                  ? '$scoreCount scores\nAverage ${averageScore.toStringAsFixed(1)} ' 
                  : 'No scores'),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailsView(course: course),
                  ),
                );
                setState(() {});
              },
            ),
            )
            
          );
        },
      ),
    );
  }
}
