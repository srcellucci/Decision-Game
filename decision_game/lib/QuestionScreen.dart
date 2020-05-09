import 'package:decisiongame/DecisionLogic.dart';
import 'package:flutter/material.dart';
import 'OutcomeScreen.dart';
import 'package:decisiongame/globals.dart' as globals;

class FirstScreen extends StatefulWidget {
  @override
  QuestionScreen createState() => QuestionScreen();
} //creates the QuestionScreen Class

//This screen asks the question
class QuestionScreen extends State<FirstScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);

  void _nextScreen() {                           //navigates to the second screen
    Navigator.of(context).push (
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return SecondScreen();
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the Decision Game',
            style: _titleFont), //Top of the screen
        actions: <Widget>[
          FlatButton(
            onPressed: _nextScreen,
            textColor: Colors.white,
            child: Text(
              "Next",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Should I...'
          ),
          style: _biggerFont, //Increase font size
          onFieldSubmitted: (text){
            globals.decision = new DecisionLogic.justText(text);
          },
        ),
      ),
      //child:
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.purple,
        child: Container(height: 50.0,),
      ),
    );

  }
}