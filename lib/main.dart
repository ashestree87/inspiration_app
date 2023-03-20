import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: DisplayPhrases(),
        ),
      ),
    );
  }
}

class DisplayPhrases extends StatefulWidget {
  const DisplayPhrases({super.key});

  @override
  _DisplayPhrasesState createState() => _DisplayPhrasesState();
}

class _DisplayPhrasesState extends State<DisplayPhrases> {
  int index = 0;
  final List<String> phrases = [
    "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
    "Success is not final, failure is not fatal: it is the courage to continue that counts.",
    "Successful people do what unsuccessful people are not willing to do.",
    "Success is not how high you have climbed, but how you make a positive difference to the world.",
  ];

  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;

  void _changePhrase() {
    setState(() {
      index = (index + 1) % phrases.length;
      _backgroundColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
      _textColor = _backgroundColor.computeLuminance() > 0.5
          ? Colors.black
          : Colors.white;
    });
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() => _changePhrase());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _changePhrase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            phrases[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _textColor,
              fontFamily: 'Open Sans',
              fontSize: 42,
            ),
          ),
        ),
      ),
    );
  }
}
