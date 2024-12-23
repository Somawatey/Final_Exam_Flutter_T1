import 'package:final_exam/1-STARTCODE/models/course.dart';
import 'package:final_exam/1-STARTCODE/widgets/course_view.dart';
import 'package:flutter/material.dart';

class CoursesView extends StatelessWidget {
  final List<Course> courses;
  const CoursesView({super.key,required this.courses});

  @override
  Widget build(BuildContext context) {
  
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        final scoreCount = course.studentScores.length;
        final averageScore = scoreCount > 0 ? course.studentScores.map((e) => e.score).reduce((a, b) => a + b) / scoreCount : 0.0;

        return Card(
          child: ListTile(
            title: Text(course.name),
            subtitle: Text(scoreCount > 0 ? '$scoreCount scores\nAverage score: $averageScore' : 'No scores'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailsView(course: course),
               ),
              );
            },
          ),
        );
      },
    );
  }
}