import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'GeminiApiService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //Enable this to test the api key and check the console
    /*_generateQuestions(context, "generate 10 questions on DSA");*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIPitara'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 5.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome to AIPitara!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/quizLogo.png', // Add a relevant image in your assets
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose a subject to start your quiz:',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildSubjectCard(context, 'Data Structures and Algorithms', Icons.code, Colors.blue),
              const SizedBox(height: 10),
              _buildSubjectCard(context, 'Object-Oriented Programming', Icons.storage, Colors.green),
              const SizedBox(height: 10),
              _buildSubjectCard(context, 'Database Management Systems', Icons.storage, Colors.orange),
              const SizedBox(height: 10),
              _buildSubjectCard(context, 'Computer Networks', Icons.network_check, Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to the quiz screen for the selected subject
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizPage(subject: title),
            ),
          );
        },
      ),
    );
  }
}

void _generateQuestions(BuildContext context, String prompt) async {
  GenerativeModelService generativeModelService = GenerativeModelService();
  final questions = await generativeModelService.generateQuestions(prompt);
  print("Questions" + questions);
}

class QuizPage extends StatelessWidget {
  final String subject;
  const QuizPage({required this.subject, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Center(
        child: Text('Quiz for $subject'),
      ),
    );
  }
}
