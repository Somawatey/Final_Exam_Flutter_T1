import 'package:final_exam/1-STARTCODE/models/course.dart';
import 'package:flutter/material.dart';

class AddScoreForm extends StatefulWidget {
  final Course course;
  const AddScoreForm({super.key,required this.course});

  @override
  State<AddScoreForm> createState() => _AddScoreFormState();
}

class _AddScoreFormState extends State<AddScoreForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _scoreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Score'),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(
       key: _formKey,
       child: Column(
         children: [
           TextFormField(
             controller: _nameController,
             maxLength: 50,
             decoration: const InputDecoration(labelText: 'Name'),
             validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter a name';
               }
               return null;
             },
           ),
           TextFormField(
             controller: _scoreController,
             decoration: const InputDecoration(labelText: 'Score'),
             keyboardType: TextInputType.number,
             validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter a score';
               }
               final score = double.tryParse(value);
               if (score == null || score < 0 || score > 100) {
                 return 'Please enter a valid score';
               }
               return null;
             },
           ),
           SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newScore = StudentScore(
                    name: _nameController.text,
                    score: double.parse(_scoreController.text),
                  );
                  setState(() {
                    widget.course.studentScores.add(newScore);
                  });
                  Navigator.pop(context, true);
                }
              },
              child: const Text('Add Score', style: TextStyle(color: Colors.white)),
            ),
         ],
       ),
     ),
      ),
      
    );
  }
}