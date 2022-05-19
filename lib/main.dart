import 'dart:math';

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
  String _word = "";
  String _revWord = "";
  int _cons = 0;
  int _vows = 0;
  int _chars = 0;
  bool _pal = false;

  void _setWord(String word) {
    setState(() {
      _word = word;
    });
  }

  void _setRevWord(String word) {
    setState(() {
      _revWord = word.split('').reversed.join();
    });
  }

  void _setVows(String word) {
    setState(() {
      int a, e, i, o, u;
      a = 'a'.allMatches(word).length;
      e = 'e'.allMatches(word).length;
      i = 'i'.allMatches(word).length;
      o = 'o'.allMatches(word).length;
      u = 'u'.allMatches(word).length;
      _vows = a + e + i + o + u;
    });
  }

  void _setCons(int chars, int vows) {
    setState(() {
      _cons = _chars - _vows;
    });
  }

  void _setChars(String word) {
    setState(() {
      _chars = word.length;
    });
  }

  void _setPal(String word, String revWord) {
    setState(() {
      if (word = revWord) {
        _pal = true;
      }
    });
  }

  //TextEditingController wordTEC = TextEditingController();

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
                onChanged: (text) {},
                //controller: wordTEC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Your word',
                ),
              ),
              TextButton(onPressed: null, child: Text('Analyze!')),
              Text("Reversed Word: "),
              Text("No of Consonants: "),
              Text("No if Vowels: "),
              Text("No of characters: "),
              Text("Palindrome: ")
            ]))

        /*const Text(
              'You have pushed the button this many times:',
            ),*/
        );
  }
}
