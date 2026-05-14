import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Score Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(
        title: 'Student Score Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController marksController = TextEditingController();

  String studentName = '';
  int marks = 0;
  String grade = '';
  String message = '';

  void calculateGrade() {
    setState(() {
      studentName = nameController.text;

      marks = int.tryParse(
        marksController.text,
      ) ?? 0;

      if (marks >= 80) {
        grade = 'A+';
      } else if (marks >= 70 ) {
        grade = 'A';
      } else if (marks >= 60) {
        grade = 'B';
      } else if (marks >= 50) {
        grade = 'C';
      } else if (marks >= 33) {
        grade = 'D';
      } else {
        grade = 'Fail';
      }

      switch (grade) {
        case 'A+':
          message = 'Excellent!';
          break;

        case 'A':
          message = 'Very Good!';
          break;

        case 'B':
          message = 'Good!';
          break;

        case 'C':
          message = 'Passed.';
          break;

        case 'D':
          message = 'Need Improvement.';
          break;

        default:
          message = 'Failed. Try Again.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: marksController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Marks',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                if(nameController.text.isEmpty || marksController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please enter both name and marks.'),
                    ),
                  );
                }
                else{
                  calculateGrade();
                }
              },
              child: const Text('Calculate'),
            ),

            const SizedBox(height: 30),

            Text(
              'Name: $studentName',
              style: const TextStyle(fontSize: 18),
            ),

            Text(
              'Marks: $marks',
              style: const TextStyle(fontSize: 18),
            ),

            Text(
              'Grade: $grade',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              message,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}