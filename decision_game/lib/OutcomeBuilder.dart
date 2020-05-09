/*
    -Builds the list of outcome options using a button listener stream
    @author: Ryan Rice
 */


import 'dart:async';
import 'package:decisiongame/OutcomeOptionLogic.dart';
import 'package:flutter/material.dart';
import 'package:decisiongame/globals.dart' as globals;
import 'OutcomeOption.dart';


class OutcomeBuilder extends StatefulWidget {
  final StreamController<void> buttonPressStream;
  OutcomeBuilder(this.buttonPressStream);

  @override
  _OutcomeBuilder createState() => _OutcomeBuilder(buttonPressStream);


}

class _OutcomeBuilder extends State<OutcomeBuilder> with AutomaticKeepAliveClientMixin<OutcomeBuilder>
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
  List<OutcomeOption> getList()
  {
    return outcomeOptionList;
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[...outcomeOptionList]
          ,)
      ),
    );

  }

  @override
  bool get wantKeepAlive => true;

}