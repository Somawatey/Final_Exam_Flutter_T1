import 'package:final_exam/1-STARTCODE/models/course.dart';
import 'package:final_exam/1-STARTCODE/widgets/score_form.dart';
import 'package:flutter/material.dart';

class CourseDetailsView extends StatelessWidget {
  final Course course;
  const CourseDetailsView({super.key,required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to the score form
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddScoreForm(course: course),
                ),
              );
            },
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ListView.builder(
        itemCount: course.studentScores.length,
        itemBuilder: (context, index) {
          final studentScore = course.studentScores[index];
          Color scoreColor;

          if (studentScore.score > 50) {
            scoreColor = Colors.green;
          } else if (studentScore.score >= 30) {
            scoreColor = Colors.orange;
          } else {
            scoreColor = Colors.red;
          }

          return ListTile(
            title: Text(studentScore.name),
            subtitle: Text('Score: ${studentScore.score}'),
            tileColor: scoreColor.withOpacity(0.2),
          );
        },
      ),
      
    );
  }
}