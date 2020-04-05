/*
# Decision-Game
Team Giraffe's decsion game project for Software Engineering I.
*/
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//Decision Game Code for Team Giraffe

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:decisiongame/globals.dart' as globals;
import 'package:provider/provider.dart';

GlobalKey<_OutcomeBuilder> globalKey = GlobalKey();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ), //changes color to purple
      home: FirstScreen(),
    );
  }
}

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
          IconButton(icon: Icon(Icons.navigate_next), onPressed: _nextScreen), //creates the 'next' arrow
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Should I...'
          ),
          style: _biggerFont, //Increase font size
        ),
      ),
      //child:

    );

  }
}

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

class OutcomeBuilder extends StatefulWidget {
  final StreamController<void> buttonPressStream;
  const OutcomeBuilder(this.buttonPressStream);

  @override
  _OutcomeBuilder createState() => _OutcomeBuilder(buttonPressStream);
}

class _OutcomeBuilder extends State<OutcomeBuilder>
{

  List<OutcomeOption> outcomeOptionList;

  StreamController<void> buttonPressStream;
  _OutcomeBuilder(this.buttonPressStream);

 void removeOutcomeOption(index) //TODO: Ensure count never < 1, handle that exception
 {
   setState(() {
     outcomeOptionList.remove(index);
     globals.count = globals.count - 1;
   });
 }

 void addOutcomeOption(){
   setState(() {
     outcomeOptionList = List.generate(globals.count, (index) => OutcomeOption(removeOutcomeOption, index: index)); //now we use the global var to increment our list for any additional outcomes > 1
     globals.count = globals.count + 1;
   });
 }

 void initState(){
   super.initState();
   outcomeOptionList = List.generate(1, (index) => OutcomeOption(removeOutcomeOption, index: index)); //Create an inital outcome option as to avoid empty list view
   buttonPressStream.stream.listen( (_) {
     setState(() {addOutcomeOption();});
   });
 }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: ListView(
        children: <Widget>[...outcomeOptionList],
        scrollDirection: Axis.vertical,
      ),
    );

  }

}

class OutcomeOption extends StatelessWidget {
 final int index;
 final Function(OutcomeOption) removeOutcomeOption;

 final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);

 const OutcomeOption(this.removeOutcomeOption, {Key key, @required this.index})
        : super(key: key);

 @override
  Widget build(BuildContext context) {
   return new Container(
       child: new Column(children: <Widget>[
         new TextFormField(
           decoration: new InputDecoration(
             labelText: 'Enter Outcome', //TODO: Save outcome string into ExpectedUtil Object/Class
             prefixIcon: Icon(Icons.queue),
             suffixIcon: new IconButton(
               icon: Icon(Icons.clear),
               onPressed: (){removeOutcomeOption(this);},
             ),
           ),
           style: _biggerFont,

         ), SizedBox(height: 50),
       ]));
  }
}


//Creates the Goodness Screen class
class ThirdScreen extends StatefulWidget {
  @override
  GoodScreen createState() => GoodScreen();
}

//Display the Goodness Screen
class GoodScreen extends State<ThirdScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Goodness Rating',
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
              return FourthScreen();
            }
        )
    );
  }
}

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















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































