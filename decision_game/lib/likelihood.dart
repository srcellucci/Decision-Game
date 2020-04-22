import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

//RUNS THE APPLICATION
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textSelectionColor: Colors.white,
      ),
      //home: MyHomePage(title: 'Ratings Screen'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  String title = "Hello there!";
  //Physically creates the states of the page
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//LIKELIHOOD RATINGS SCREEN USER INTERFACE
class _MyHomePageState extends State<MyHomePage> {
  //Declaring local variables

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(200.0, 200.0);

  List<String> outcomesList = List(5);
  List<double> likeList = List(5);

  int index = 0; //Index used to access the outcome within list of outcomes

  //Mutable String for displaying the current outcome
  String _outputOutcome = "";
  String _outputValue = "";

  double value = 0.0; //Variable used to display the percentage value of the likelihood
  Color labelColor = Colors.black; //Color of the percentage label

  //Adds things to the list to be further displayed and dynamically rotated about
  //USED FOR TESTING PURPOSES

  /*
    Changes the value of of the string that is displayed
    everytime the continue button is pressed

    1. Stores value incremented/decremented by user into a global list of likelihood
    2. Resets all dependent values in preparation for the next outcome
  */

  void changeData() {
    setState(() {
      //Saves the value of
      likeList[index] = this.value;

      //Resets the visuals of the chart
      value = 0.0;
      List<CircularStackEntry> data = _generateChartData(value);
      _chartKey.currentState.updateData(data);
      labelColor = Colors.black;

      //Increments for the next index
      index++;
    });
  }

  //Increases the percentage by 5%

  void _increment() {
    setState(() {
      if (value < 100) {
        value += 5;
        List<CircularStackEntry> data = _generateChartData(value);
        _chartKey.currentState.updateData(data);
      }
    });
  } //End of _increment()

  //Decreases the percentage by 5%
  void _decrement() {
    setState(() {
      if (value > -100) {
        value -= 5;
        List<CircularStackEntry> data = _generateChartData(value);
        _chartKey.currentState.updateData(data);
      }
    });
  } //End of _decrement()

  //Builds the visual representation of the chart model
  //Chart Model Type - CircularChartTyper.Radial
  List<CircularStackEntry> _generateChartData(double value) {
    Color dialColor = Colors.blue;
    if (value < 0) {
      dialColor = Colors.red;
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

  //Builds the UI of the Likelihood Ratings Screen
  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .title
        .merge(new TextStyle(color: labelColor));

    //TESTING PURPOSES
    outcomesList[0] = "Outcome 1";
    outcomesList[1] = "Outcome 2";
    outcomesList[2] = "Outcome 3";
    outcomesList[3] = "Outcome 4";
    outcomesList[4] = "Outcome 5";

    //Manages the value of the display variable
    //based upon current index value

    if (index < outcomesList.length) {
      _outputOutcome = outcomesList[index];
    } else {
      index = 0;
      _outputOutcome = outcomesList[index];
    }

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Likelihood Ratings Screen"),
      ),
      body: new Center(
        child: Container(
          alignment: Alignment.center,
          //margin creates boundaries from each side of the screen
          margin: EdgeInsets.fromLTRB(15.0, 75.0, 15.0, 50.0),
          child: Column(
            children: <Widget>[
              /*
                  Widget 1 - Main Header
                  - Provides instructions to user about screen
                  @author: JT Kurtz
                */
              Text(
                "How likely are you to:  \n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
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
                initialChartData: _generateChartData(value),
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
    );
  } //End of build()
} //End of _MyHomePageState()
