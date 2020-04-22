/*
    -Outcome screen in which a user can define each possible outcome
    for a given decision
    @author: Ryan Rice
 */


import 'package:flutter/material.dart';
import 'GoodScreen.dart';
import 'dart:async';
import 'OutcomeBuilder.dart';




//Creates the OutcomeScreen Class
class SecondScreen extends StatefulWidget {
  @override
  OutcomeScreen createState() => OutcomeScreen();
}

//This screen will display the outcomes

class OutcomeScreen extends State<SecondScreen> {
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);
  static StreamController<void> buttonPressStream = StreamController<bool>.broadcast();
  final OutcomeBuilder outcomes = new OutcomeBuilder(buttonPressStream);



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new LayoutBuilder(builder: (context, constraint) {

        final _maxHeight= constraint.biggest.height;

        return new Center(

          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(30.0),
                height: _maxHeight,
                child: outcomes,
              ),],
          ),
        );
      }),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => buttonPressStream.add(null),
        tooltip: 'Increment Counter',
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
      ),

      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,

      appBar: AppBar(
        title: Text('Possible Outcomes',
          style: _titleFont,
        ), //End of Text
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
              return ThirdScreen();
            }
        )
    );
  }
}