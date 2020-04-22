import 'package:flutter/material.dart';
import 'OutputScreen.dart';




//Creates the Overview Screen
class FifthScreen extends StatefulWidget {
  @override
  OverviewScreen createState() => OverviewScreen();
}

//Displays an overview of all the inputs
class OverviewScreen extends State<FifthScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview',
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
              return SixthScreen();
            }
        )
    );
  }
}