/*
# Decision-Game
Team Giraffe's decision game project for Software Engineering I.
*/
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//Decision Game Code for Team Giraffe

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:decisiongame/globals.dart' as globals;
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    //Local variables for Rating Screen
  var outcomesList = new List();
  int index = 0;
  String _output = "Hello! Welcome to the Ratings Screen.";

//Adds things to the list to be further displayed and dynamically rotated about
  void populateList()
  {
  outcomesList.add("OUTCOME #1");
  outcomesList.add("OUTCOME #2");
  outcomesList.add("OUTCOME #3");
  }

  void changeData()
  {
    setState((){
        if (index<outcomesList.length)
        {
          _output = outcomesList[index];
          index++;
        }//End of if
        else
        {
          if (index >= outcomesList.length)
          {
            _output = "END OF LIST";
          }//End of if
        }//End of else
    });
  }

  //App builds user interface and adds functionality accordingly
  @override
  Widget build(BuildContext context) {
    populateList();
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Ratings Screen"),
        ),
       body:  new Center(
         child: Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20),
              alignment: Alignment.center,
              color: Colors.lightBlue,
              
              child: Column(
                  children: <Widget>[
               /*
                Widget 1 - Main Header
                - Provides instructions to user about screen
                @author: JT Kurtz
              */
                Expanded(
                    child: Text (
                    'Define the goodness of the following outcome:',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                      
                      ), 
                    ),
              ), //End of Main Header Grouping
              
              /*
                Widget 2 - Dynamic Outcome Diplaying
                Based upon onPressed() of a button
                @author: JT Kurtz
              */

              Expanded(
                    child: Text (
                    '$_output',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                      ), 
                    ),
              ), 

              
               /*
                Widget 3 - List Wheel Scroll View
                - User defines the goodness of an outcome
                @author: JT Kurtz
              */
              Expanded(
                
                child:ListWheelScrollView(
              itemExtent: 100,
              children: <Widget>[
              
            //BOX 1 - FACE PLUS 2
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                height: 100.0,
                width: 100.0,
                color : Colors.orange,
                child: 
                  Icon(
                  FontAwesomeIcons.solidGrin,
                  size: 65.0,
                ),
                  ),
            ),
            //BOX 2 - FACE PLUS 1
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                height:100.0,
                width: 100.0,
                color: Colors.green,
                child: 
                  Icon(
                  FontAwesomeIcons.solidSmile,
                  size: 65.0,
                ),
                  ),
            ),
            //BOX 3 - FACE ZERO
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                height:100.0,
                width: 100.0,
                color: Colors.yellow,
                child: 
                  Icon(
                  FontAwesomeIcons.solidMeh,
                  size: 65.0,
                ),
                  ),
            ),
            //BOX 4 - FACE MINUS 1
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                height:100.0,
                width: 100.0,
                color: Colors.blue,
                child: 
                  Icon(
                  FontAwesomeIcons.solidFrown,
                  size: 65.0,
                ),
                  ),
            ),
            //BOX 5 - FACE MINUS 2
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                height:100.0,
                width: 100.0,
                color: Colors.red,
                child: 
                  Icon(
                  FontAwesomeIcons.solidFrownOpen,
                  size: 65.0,
                  
                ),
                  ),
            ),
          ],
      ),
      ), //End of ListWheelScrollView Grouping

       /*
         Widget 4 - Continue Button
         - Should allow user to continue through list of outcomes
         - until everything has been answered and then you can proceed 
         - to the next screen
        @author: JT Kurtz
        */
      Expanded(
         child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    changeData();
                  },
                  padding: const EdgeInsets.all(0.0),
                  color: Colors.yellow,
                  child: Text (
                  'Continue',
                  style: TextStyle(fontSize: 20.0),
                  ),
                  
                 
                ),
              ],
              ),            
       ),
          
      ), //End of Continue Button Grouping
],
),
    ),
    ));
  }//End of build()


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















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































