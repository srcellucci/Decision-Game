/*
    -Outcome option used to define each possible outcome to be considered
    in a given decision
    @author: Ryan Rice
 */

import 'package:flutter/material.dart';
import 'package:decisiongame/globals.dart' as globals;
import 'OutcomeOptionLogic.dart';

// ignore: must_be_immutable
class OutcomeOption extends StatelessWidget {
  final int index;
  final Function(OutcomeOption) removeOutcomeOption;
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final int objectIndex = globals.count-1;
  OutcomeOptionLogic outcome;



String setText() {
    return (outcome != null) ? outcome.getOutcomeText() : " ";
}


  OutcomeOption(this.removeOutcomeOption, {Key key, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
          new TextFormField(
            initialValue:setText(),
            decoration: new InputDecoration(
              labelText: 'Enter Outcome',
              prefixIcon: Icon(Icons.queue),
              suffixIcon: new IconButton(
                icon: Icon(Icons.clear),
                onPressed: (){removeOutcomeOption(this); globals.decision.removeOutcome(outcome);},
              ),
            ),
            style: _biggerFont,
            onFieldSubmitted: (text){
              outcome = new OutcomeOptionLogic(text);
             globals.decision.addOutcome(outcome);
            },
          ), SizedBox(height: 50),
        ]));
  }
}