import 'package:decisiongame/DecisionLogic.dart';
import 'package:decisiongame/QuestionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;



//Creates the output screen
class SixthScreen extends StatefulWidget {
  @override
  OutputScreen createState() => OutputScreen();
}

//Displays the output of the decision game
class OutputScreen extends State<SixthScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);
  double _expectedUtility;
  Color containerBgCol = Colors.amber;

  String getDecision() {
    String decision = "";
    _expectedUtility = globals.decision.calcExpectedUtil();
    if(_expectedUtility > 0){
        decision = "You should " + globals.decision.getText();
        containerBgCol = Colors.green;
        return decision;
    }
    else if(_expectedUtility < 0){
        decision = "You should not " + globals.decision.getText();
        containerBgCol = Colors.red;
        return decision;
    }
    else {
      containerBgCol = Colors.amber;
      decision = "Its a toss up";
      return decision;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Output',
            style: _titleFont),
        actions: <Widget>[
          FlatButton(
            onPressed:()=> SystemNavigator.pop(),
            textColor: Colors.white,
            child: Text(
              "Exit",
              style: TextStyle(fontSize: 20.0),
            ),
          ), //creates the 'next' arrow
        ],//Top of the screen
      ),

      body: Column(
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
      child: Center(
      child: Text(
        "You asked: ",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
        ),
      ),),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
      child: Text(
        globals.decision.getText() + "?",
        textAlign: TextAlign.center,
        style: TextStyle(
        fontSize: 25,
          ),
        ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
      child: Text(
        "Based on what you've inputted: ",
         textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 22,
          ),
         ),
    ),
    Expanded(
    child: Center(
     child: Card(
      child: ListTile(
        title: Text(
          getDecision(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 21.0,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          ),
        ),
       color: containerBgCol,
      ),
     ),
    ),
          ],
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.purple,
        child: Container(height: 50.0,),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=> {
          globals.decision = new DecisionLogic(),
          _nextScreen(),
        },
        tooltip: 'Increment Counter',
        backgroundColor: Colors.purple,
        label: Text('New Decision'),
      ),

      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,


    );
  }
  void _nextScreen() {
    //navigates to the Third screen
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return FirstScreen();
    }));
  }
}
