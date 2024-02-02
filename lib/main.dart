import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Counter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.black, // Set background color to black
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white), // Set hint (input text) color to white
        ),
      ),
      home: const MyHomePage(title: 'Word Counter'),
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
  int _wordCount = 0;
  final TextEditingController _textController = TextEditingController();

  void _updateWordCount() {
    setState(() {
      _wordCount = _textController.text.split(' ').length;
    });
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateWordCount);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              style: const TextStyle(color: Colors.white), // Set text color to white
              decoration: const InputDecoration(
                hintText: 'Enter a sentence',
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Number of words: $_wordCount',
              style: const TextStyle(fontSize: 16.0, color: Colors.white), // Set text color to white
            ),
          ],
        ),
      ),
    );
  }
}
