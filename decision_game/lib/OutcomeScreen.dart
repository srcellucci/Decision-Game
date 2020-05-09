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

class OutcomeScreen extends State<SecondScreen> with AutomaticKeepAliveClientMixin<SecondScreen> {
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);
  final OutcomeBuilder outcomes = new OutcomeBuilder(buttonPressStream);
  static StreamController<void> buttonPressStream = StreamController<bool>.broadcast();


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
        color: Colors.purple,
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}