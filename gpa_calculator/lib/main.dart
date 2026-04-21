import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student GPA Calculator',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Student GPA Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController subject1 = TextEditingController();
  TextEditingController subject2 = TextEditingController();
  TextEditingController subject3 = TextEditingController();
  TextEditingController subject4 = TextEditingController();

  String gpaResult = '';
  String statusMessage = '';
  bool result = false;

  void calculateGPA() {
    double grade1 = double.tryParse(subject1.text) ?? 0.0;
    double grade2 = double.tryParse(subject2.text) ?? 0.0;
    double grade3 = double.tryParse(subject3.text) ?? 0.0;
    double grade4 = double.tryParse(subject4.text) ?? 0.0;

    double gpa = (grade1 + grade2 + grade3 + grade4) / 4;

    setState(() {
      gpaResult = 'Your GPA is: ${gpa.toStringAsFixed(2)}';
      statusMessage = gpa >= 2.0 ? 'Status: Passed' : 'Status: Failed';
      result = true;
    });

  }

  double gradeToPoint(double grade) {
    if (grade >= 80) return 4.00;
    if (grade >= 75) return 3.67;
    if (grade >= 70) return 3.33;
    if (grade >= 65) return 3.00;
    if (grade >= 60) return 2.67;
    if (grade >= 55) return 2.33;
    if (grade >= 50) return 2.00;
    if (grade >= 45) return 1.67;
    if (grade >= 40) return 1.33;
    if (grade >= 35) return 1.00;
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(('assets/logo_uum.png'), scale: 2.5,
            ),
            Text (
              'Enter your grades for 4 subjects (0-100):',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            TextField(
              controller: subject1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Subject 1',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: subject2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Subject 2',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: subject3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Subject 3',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: subject4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Subject 4',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: calculateGPA,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Calculate GPA',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        subject1.clear();
                        subject2.clear();
                        subject3.clear();
                        subject4.clear();
                        gpaResult = '';
                        statusMessage = '';
                        result = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Reset',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ),
                )
              ],
            ),

            SizedBox(height: 20),

            if (result)
              Container(
                padding: EdgeInsets.all(16),
                decoration: 
                  BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),

                child: Column(
                  children: [
                    Text(
                      'Your GPA Result',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      gpaResult,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      statusMessage,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
          ],
        ),  
      ),  
    );
  }
}
