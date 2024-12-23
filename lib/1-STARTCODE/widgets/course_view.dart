import 'package:final_exam/1-STARTCODE/models/course.dart';
import 'package:final_exam/1-STARTCODE/widgets/score_form.dart';
import 'package:flutter/material.dart';

class CourseDetailsView extends StatefulWidget {
  final Course course;
  const CourseDetailsView({super.key,required this.course});

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
                await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddScoreForm(course: widget.course),
                ),
              );
                setState(() {});
            },
          )
        ],
        backgroundColor: Colors.blue[700],
        title: Text(widget.course.name),
      ),
      body: ListView.builder(
        itemCount: widget.course.studentScores.length,
        itemBuilder: (context, index) {
          final studentScore = widget.course.studentScores[index];
          Color scoreColor;

          if (studentScore.score > 50) {
            scoreColor = Colors.green;
          } else if (studentScore.score >= 30) {
            scoreColor = Colors.orange;
          } else {
            scoreColor = Colors.red;
          }
          
          return ListTile(

            title: Row(
              children: [
                Expanded(
                  child: Text(studentScore.name),
                ),
                Text(
                  '${studentScore.score}',
                  style: TextStyle(color: scoreColor),
                ),
              ],
            )
           
          );
        },
      ),
      
    );
  }
}