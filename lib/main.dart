import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Analyzer',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Word Analyzer - 1917565'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String word = "";
  String revWord = "";
  int cons = 0;
  int vow = 0;
  int char = 0;
  bool pal = false;

  TextEditingController wordTEC = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Enter your word",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: wordTEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Your word',
                setState(() {
                  word = wordTEC;
                },)
              ),
            ),
            TextButton(
              onPressed: null,
              child: Text('Analyze!')
            ),
            Text("Reversed Word: "),
            Text("No of Consonants: "),
            Text("No if Vowels: "),
            Text("No of characters: "),
            Text("Palindrome: ")

          ]

            )
        )

            /*const Text(
              'You have pushed the button this many times:',
            ),*/
        );
  }
}
