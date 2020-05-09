import 'package:flutter/material.dart';



//Creates the output screen
class SixthScreen extends StatefulWidget {
  @override
  OutputScreen createState() => OutputScreen();
}

//Displays the output of the decision game
class OutputScreen extends State<SixthScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Output',
            style: _titleFont), //Top of the screen
      ),
    );
  }
}
