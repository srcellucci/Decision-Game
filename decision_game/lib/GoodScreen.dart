/*
   -Goodness Screen for the decision game, allows users to define each outcomes
   utility
   @authors: JT Kurtz, Ryan Rice
 */


import 'package:decisiongame/OutcomeOptionLogic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ProbScreen.dart';
import 'package:decisiongame/globals.dart' as globals;

//Creates the Goodness Screen class
class ThirdScreen extends StatefulWidget {
  @override
  GoodScreen createState() => GoodScreen();
}

//Display the Goodness Screen
class GoodScreen extends State<ThirdScreen> {
  //Local variables for Rating Screen
  Set<OutcomeOptionLogic> outcomes = globals.decision.getOutcomes();
  int index = 0;
  String _output = "Hello! Welcome to the Ratings Screen.";

//Adds things to the list to be further displayed and dynamically rotated about


  void changeData()
  {
    setState((){
      if (index<outcomes.length)
      {
        _output =  outcomes.elementAt(index).getOutcomeText();
        index++;
      }//End of if
      else
      {
        if (index >= outcomes.length)
        {
          _output = "END OF LIST";
        }//End of if
      }//End of else
    });
  }

  //App builds user interface and adds functionality accordingly
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: new AppBar(
          title: new Text("Ratings Screen"),
        ),
        body:  new Center(
          child: Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20),
            alignment: Alignment.center,
            color: Colors.white,

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
                        color: Colors.black

                    ),
                  ),
                ), //End of Main Header Grouping

                /*
                Widget 2 - Dynamic Outcome Displaying
                Based upon onPressed() of a button
                @author: JT Kurtz
              */

                Expanded(
                  child: Text (
                    '$_output',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black
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
                          color: Colors.purple,
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
