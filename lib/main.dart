import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_basic_assignment/dto/guestDto.dart';
import 'package:widget_basic_assignment/guessOptions.dart';
import 'package:widget_basic_assignment/sayMonitor.dart';

// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
void main() => runApp(const MySimpleApp());

class MySimpleApp extends StatefulWidget {
  const MySimpleApp({Key? key}) : super(key: key);

  @override
  _MySimpleAppState createState() => _MySimpleAppState();
}

class _MySimpleAppState extends State<MySimpleApp> {
  static const String defaultText = 'Guess, what food i like to eat ?';

  String _sayTheText = defaultText;
  bool _isTheGuessTrue = false;

  final List<GuessDto> _guessDtos = [
    GuessDto(guessText: 'Pizza'),
    GuessDto(guessText: 'Burger', response: 'Try Again !'),
    GuessDto(guessText: 'Spaghetti', response: 'Exactly. You are right !!', isItTrue: true),
  ];

  void _guessCallback(String response, bool isItTrue) {
    setState(() {
      _sayTheText = response;
      _isTheGuessTrue = isItTrue;
    });
  }

  void _resetCallback() {
    setState(() {
      _sayTheText = defaultText;
      _isTheGuessTrue = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Simple App'),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SayMonitor(sayText: _sayTheText),
              !_isTheGuessTrue
                  ? GuessOptions(
                      guessDtos: _guessDtos, guessHandler: _guessCallback)
                  : ElevatedButton(
                      onPressed: _resetCallback,
                      child: Text('Reset'),
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
