import 'package:flutter/material.dart';
import 'OverviewScreen.dart';

//Creates the Probability Screen Class
class FourthScreen extends StatefulWidget {
  @override
  ProbScreen createState() => ProbScreen();
}

//Displays the Probability Screen
class ProbScreen extends State<FourthScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Probability',
            style: _titleFont), //Top of the screen
        actions: <Widget>[
          IconButton(icon: Icon(Icons.navigate_next), onPressed: _nextScreen), //creates the 'next' arrow
        ],
      ),
    );
  }


  void _nextScreen() { //navigates to the Third screen
    Navigator.of(context).push (
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return FifthScreen();
            }
        )
    );
  }
}