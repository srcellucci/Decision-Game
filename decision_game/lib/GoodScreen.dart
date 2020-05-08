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
  int value = 0;
  String _output = "";

//Assigns the rating
  void defineRating(int number) {
    setState(() {
        outcomes.elementAt(index).setGoodness(number); 
    });
  }

  void changeData() {
    setState(() {
      index++;
      //End of if
    });
  }

  void defineValue(int number) {
    value = number;
  }
  //App builds user interface and adds functionality accordingly
  @override
  Widget build(BuildContext context) {
   
    if (index < outcomes.length) {
      _output = outcomes.elementAt(index).getOutcomeText();
    } else {
      index = 0;
      _output = outcomes.elementAt(index).getOutcomeText();
    }


    return Scaffold(
        appBar: new AppBar(
          title: new Text("Ratings Screen"),
          backgroundColor: Colors.purple,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: _nextScreen,
            )
          ],
        ),
        body: SingleChildScrollView(
                  child: new Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 25.0, 0, 25.0),
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  //Header
                  Text(
                    'Define the goodness of the following outcome:\n',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35.0, color: Colors.black, ),
                  ),

                  //Outcome Display
                  Text(
                    '$_output\n', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28.0, color: Colors.black),
                  ),

                  //ListScrollWheelView
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    height: 200.0,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        //BOX 1 - PLUS 5
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(5);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(FontAwesomeIcons.solidGrinStars,
                                size: 75.0, color: Colors.black),
                            color: Colors.green,
                          ),
                        ),

                        //BOX 2 - PLUS 4
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(4);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidLaugh,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.green[400],
                          ),
                        ),

                        //BOX 3 - PLUS 3
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(3);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidGrin,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.green[300],
                          ),
                        ),

                        //BOX 4 - PLUS 2
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(2);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidSmileBeam,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.green[200],
                          ),
                        ),

                        //BOX 5 - PLUS 1
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(1);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidSmile,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.green[100],
                          ),
                        ),

                        //BOX 6 - Zero
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(0);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidMeh,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.yellow,
                          ),
                        ),

                        //BOX 7 - MINUS 1
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(-1);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidFrown,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.red[100],
                          ),
                        ),

                        //BOX 8 - MINUS 2
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(-2);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidFrownOpen,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.red[200],
                          ),
                        ),

                        //BOX 9 - MINUS 3
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(-3);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidFlushed,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.red[300],
                          ),
                        ),

                        //BOX 10 - MINUS 4
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(-4);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidAngry,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.red[400],
                          ),
                        ),

                        //BOX 11 - MINUS 5
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 150.0,
                          child: RaisedButton(
                            onPressed: () {
                              defineRating(-5);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            child: Icon(
                              FontAwesomeIcons.solidDizzy,
                              size: 75.0,
                              color: Colors.black,
                            ),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),

                

                  //Continue button
                  RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.yellow,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5)),
                    child: Text(
                      'Next Outcome',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    onPressed: () {
                      changeData();
                    },
                  ),
                ],
              ),
            ),
          ),
        )
        );
  
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
