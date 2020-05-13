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
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);
  static Set<OutcomeOptionLogic> outcomes = globals.decision.getOutcomes();
  static int index = 0;
  static String _output = outcomes.elementAt(index).getOutcomeText();


//Adds things to the list to be further displayed and dynamically rotated about


  void changeData()
  {
    setState((){
      _output = outcomes.elementAt((index+1)%outcomes.length).getOutcomeText();
      index = ((index+1)%outcomes.length);
    });
  }

  //App builds user interface and adds functionality accordingly
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Goodness Screen',
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

        body: new Center(
        child: Container(
        padding: EdgeInsets.fromLTRB(0, 25.0, 0, 25.0),
    alignment: Alignment.center,
    margin: EdgeInsets.all(10.0),
    child: Column(
      children: <Widget>[//Header
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
                          outcomes.elementAt(index).setGoodness(5);},
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
                            outcomes.elementAt(index).setGoodness(4);
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
                          outcomes.elementAt(index).setGoodness(3);
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
                          outcomes.elementAt(index).setGoodness(2);
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
                          outcomes.elementAt(index).setGoodness(1);
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
                          outcomes.elementAt(index).setGoodness(0);
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
                          outcomes.elementAt(index).setGoodness(-1);
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
                          outcomes.elementAt(index).setGoodness(-2);
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
                          outcomes.elementAt(index).setGoodness(-3);
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
                        outcomes.elementAt(index).setGoodness(-4);
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
                         outcomes.elementAt(index).setGoodness(-5);
                        },
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5)),
                        child: Icon(
                        FontAwesomeIcons.solidDizzy,
                        size: 75.0,
                        color: Colors.black,
                        ),
                        color: Colors.red,),
                        ),],),),],),),),




    bottomNavigationBar: BottomAppBar(
         shape: const CircularNotchedRectangle(),
         color: Colors.purple,
         child: Container(height: 50.0,),
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{changeData()},
        tooltip: 'Increment Counter',
        backgroundColor: Colors.purple,
        child: Icon(Icons.arrow_forward),
      ),

      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,


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
