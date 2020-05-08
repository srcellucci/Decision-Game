import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'OverviewScreen.dart';
import 'package:decisiongame/globals.dart' as globals;
import 'package:decisiongame/OutcomeOptionLogic.dart';

//Creates the Probability Screen Class
class FourthScreen extends StatefulWidget {
  @override
  ProbScreen createState() => ProbScreen();
}

//Displays the Probability Screen
class ProbScreen extends State<FourthScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(200.0, 200.0);
  
  Set<OutcomeOptionLogic> outcomes = globals.decision.getOutcomes();
  int index = 0;

  String _outputQuestion = globals.decision.getText();
  String _outputOutcome = "";
  String _outputValue = "";

  int value = 50;
  Color labelColor = Colors.black;

  void changeData(){
    setState(() {
      outcomes.elementAt(index).setLikelihood(value);

      value = 50;
      List<CircularStackEntry> data = _generateChartData(value.toDouble());
      _chartKey.currentState.updateData(data);
      labelColor = Colors.black;

      index++;
    });
  }

  void _increment() {
    setState(() {
      if (value < 100) {
        value += 5;
        List<CircularStackEntry> data = _generateChartData(value.toDouble());
        _chartKey.currentState.updateData(data);
      }
    });
  } //End of _increment()

  void _decrement() {
    setState(() {
      if (value > 0) {
        value -= 5;
        List<CircularStackEntry> data = _generateChartData(value.toDouble());
        _chartKey.currentState.updateData(data);
      }
    });
  } //End of _decrement()

  List<CircularStackEntry> _generateChartData(double value) {
    Color dialColor = Colors.black;
    if (value < 50) {
      dialColor = Colors.red;
    }
    else
    {
      if (value > 50)
      {
        dialColor = Colors.blue;
      }
    }

    labelColor = dialColor;

    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value,
            dialColor,
            rankKey: 'percentage',
          )
        ],
        rankKey: 'percentage',
      ),
    ];

    return data;
  } //End of _generateChartData()
  
  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .title
        .merge(new TextStyle(color: labelColor));

    if (index < outcomes.length) {
      _outputOutcome = outcomes.elementAt(index).getOutcomeText();
    } else {
      index = 0;
      _outputOutcome = outcomes.elementAt(index).getOutcomeText();
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Probability',
        style: _titleFont), 
        //Top of the screen
        actions: <Widget>[
          IconButton(icon: Icon(Icons.navigate_next), onPressed: _nextScreen), //creates the 'next' arrow
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
              child: new Center(
          child: Container(
            alignment: Alignment.center,
            //margin creates boundaries from each side of the screen
            margin: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 50.0),
            child: Column(
              children: <Widget>[
                /*
                    Widget 1 - Main Header
                    - Provides instructions to user about screen
                    @author: JT Kurtz
                  */
                  
                Text(
                  "If you: \n\n $_outputQuestion, \n\n How likely is the following:  \n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),

                /*
                    Widget 2 - Dynamic Outcome Displaying
                    Based upon onPressed() of a button
                    @author: JT Kurtz
                  */
                Text(
                  '$_outputOutcome\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.0, color: Colors.black),
                ),

                /*
                  Widget 3 - Animated Circular Chart
                  Visual display of a user's percentage value
                  of completing an outcome
                  @author: JT Kurtz
                  */

                AnimatedCircularChart(
                  key: _chartKey,
                  size: _chartSize,
                  initialChartData: _generateChartData(value.toDouble()),
                  chartType: CircularChartType.Radial,
                  edgeStyle: SegmentEdgeStyle.round,
                  percentageValues: true,
                  holeLabel: '$value%',
                  labelStyle: _labelStyle,
                ),

                /*
                Widgets 4 & 5 - Increment/Decrement Buttons
                -Increment and decrement buttons to affect the 
                percentage value
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                   
                    new RaisedButton(
                      onPressed: _decrement,
                      child: const Icon(Icons.remove),
                      shape: const CircleBorder(),
                      elevation: 10.0,
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                    new RaisedButton(
                      onPressed: _increment,
                      child: const Icon(Icons.add),
                      shape: const CircleBorder(),
                      elevation: 10.0,
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),

                /*
                  Widget 6 - Continue Button
                  - Allows user to continue through list of outcomes
                  until everything has bee answered
                  **If at end of list, change string from 'Next' to 'Continue'
                */
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25,0,0),
                      child: RaisedButton(
                        onPressed: () {
                          changeData();
                        },
                        padding: const EdgeInsets.all(10.0),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.5)
                            ),
                        color: Colors.yellow,
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
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