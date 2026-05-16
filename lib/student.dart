import 'package:flutter/material.dart';

class StudentListManagerScreen extends StatefulWidget {
  const StudentListManagerScreen({super.key});

  @override
  State<StudentListManagerScreen> createState() =>
      _StudentListManagerScreenState();
}

class _StudentListManagerScreenState extends State<StudentListManagerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> students = [];

  String loopOutput = '';

  void addStudent() {
    final String name = nameController.text.trim();
    final int marks = int.tryParse(marksController.text.trim()) ?? 0;

    if (name.isEmpty) {
      return;
    }

    final Map<String, dynamic> student = {
      'name': name,
      'marks': marks,
      'passed': marks >= 40,
    };

    setState(() {
      students.add(student);
      nameController.clear();
      marksController.clear();
    });
  }
  void removeStudent(String name) {
    setState(() {
      students.removeWhere(
            (student) =>
        student['name'].toString().toLowerCase() == name.toLowerCase(),
      );
    });
  }

  void sortStudents() {
    setState(() {
      students.sort(
            (a, b) => a['name'].toString().compareTo(
          b['name'].toString(),
        ),
      );
    });
  }

  List<Map<String, dynamic>> get searchedStudents {
    final String query = searchController.text.trim().toLowerCase();

    return students.where((student) {
      return student['name'].toString().toLowerCase().contains(query);
    }).toList();
  }

  Set<String> get uniqueNames {
    return students.map((student) => student['name'].toString()).toSet();
  }

  List<String> get allStudentNames {
    return students.map((student) => student['name'].toString()).toList();
  }

  List<String> get passedStudentNames {
    return [
      for (final student in students)
        if (student['passed'] == true) student['name'].toString(),
    ];
  }

  List<String> get failedStudentNames {
    return [
      for (final student in students)
        if (student['passed'] == false) student['name'].toString(),
    ];
  }

  List<String> get combinedNamesUsingSpread {
    return [
      'All Students:',
      ...allStudentNames,
      if (students.isEmpty) 'No students added yet',
    ];
  }

  Future<void> runForLoopExample() async {
    String result = 'For Loop Output:\n';

    for (int i = 0; i < students.length; i++) {
      result += '${i + 1}. ${students[i]['name']}\n';
    }

    if (students.isEmpty) {
      result += 'No students available.\n';
    }

    setState(() {
      loopOutput = result;
    });
  }

  void runWhileLoopExample() {
    String result = 'While Loop Output:\n';

    int i = 0;

    while (i < students.length) {
      result += '${i + 1}. ${students[i]['name']}\n';
      i++;
    }

    if (students.isEmpty) {
      result += 'No students available.\n';
    }

    setState(() {
      loopOutput = result;
    });
  }

  void runDoWhileLoopExample() {
    String result = 'Do-While Loop Output:\n';

    int i = 0;

    do {
      if (students.isEmpty) {
        result += 'Do-while runs at least once.\n';
      } else {
        result += '${i + 1}. ${students[i]['name']}\n';
      }

      i++;
    } while (i < students.length);

    setState(() {
      loopOutput = result;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    marksController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> visibleStudents = searchedStudents;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List Manager', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: marksController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Marks',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: addStudent,
                    child: const Text('Add'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: sortStudents,
                    child: const Text('Sort'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            TextField(
              controller: searchController,
              onChanged: (_) {
                setState(() {});
              },
              decoration: const InputDecoration(
                labelText: 'Search Student',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Unique Names Set: $uniqueNames',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              'Passed Students: $passedStudentNames',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              'Failed Students: $failedStudentNames',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              'Spread List: $combinedNamesUsingSpread',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: runForLoopExample,
                    child: const Text('For'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: runWhileLoopExample,
                    child: const Text('While'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: runDoWhileLoopExample,
                    child: const Text('Do-While'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.black12,
              child: Text(loopOutput),
            ),

            const SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: visibleStudents.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> student = visibleStudents[index];

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: student['passed'] == true
                        ? Colors.green[100]
                        : Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student['name'].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Marks: ${student['marks']}'),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red,),
                        onPressed: () => removeStudent(student['name'].toString()),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}