//Muhammad Asyraf Bin Azman
//1917565

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
    _calculate();
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
      if (word == revWord) {
        _pal = true;
      } else {
        _pal = false;
      }
    });
  }

  String _getWord() {
    return _word;
  }

  String _getRevWord() {
    return _revWord;
  }

  int _getChars() {
    return _chars;
  }

  int _getVows() {
    return _vows;
  }

  int _getCons() {
    return _cons;
  }

  bool _getPal() {
    return _pal;
  }

  void _calculate() {
    _setChars(_word);
    _setRevWord(_word);
    _setVows(_word);
    _setCons(_chars, _vows);
    _setPal(_word, _revWord);
  }

  TextEditingController myController = new TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
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
                children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Enter your word:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                  controller: myController,
                ),
              ),
              ElevatedButton(
                  onPressed: () => _setWord(myController.text),
                  child: Text('Analyze!')),
              Column(
                children: <Widget>[
                  Text("Reversed Word: $_revWord"),
                  Text("No of Consonants: $_cons"),
                  Text("No if Vowels: $_vows"),
                  Text("No of characters: $_chars"),
                  Text("Palindrome: $_pal")
                ],
              )
            ])));
  }
}
