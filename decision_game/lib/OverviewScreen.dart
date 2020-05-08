import 'package:flutter/material.dart';
import 'OutputScreen.dart';
import 'package:decisiongame/globals.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:decisiongame/OutcomeOptionLogic.dart';

//Creates the Overview Screen
class FifthScreen extends StatefulWidget {
  @override
  OverviewScreen createState() => OverviewScreen();
}

//Displays an overview of all the inputs
class OverviewScreen extends State<FifthScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  final TextStyle _titleFont = const TextStyle(fontSize: 20.0);

  Icon displayIcon;
  Color containerBgCol = Colors.amber;
  var _items = ['Adjust Outcomes', 'Adjust Goodness', 'Adjust Likelihood'];
  var _itemSelected = "";

  void onChangeDD(String value) {
    setState(() {
      if (value.contains('outcomes')) {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return SixthScreen();
        }));
      }

      if (value.contains('goodness')) {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return SixthScreen();
        }));
      }

      if (value.contains('likelihood')) {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return SixthScreen();
        }));
      }
    });
  }

  Icon getGoodnessIcon(int number) {
    Icon display;

    switch (number) {
      case 5:
        {
          display = new Icon(
            FontAwesomeIcons.solidGrinStars,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.green;
          break;
        }

      case 4:
        {
          display = new Icon(
            FontAwesomeIcons.solidLaugh,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.green[400];
          break;
        }

      case 3:
        {
          display = new Icon(
            FontAwesomeIcons.solidGrin,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.green[300];
          break;
        }

      case 2:
        {
          display = new Icon(
            FontAwesomeIcons.solidSmileBeam,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.green[200];
          break;
        }

      case 1:
        {
          display = new Icon(
            FontAwesomeIcons.solidSmile,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.green[100];
          break;
        }

      case 0:
        {
          display = new Icon(
            FontAwesomeIcons.solidMeh,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.yellow;
          break;
        }

      case -1:
        {
          display = new Icon(
            FontAwesomeIcons.solidFrown,
            color: Colors.black,
            size: 20,
          );

          containerBgCol = Colors.red[100];
          break;
        }

      case -2:
        {
          display = new Icon(
            FontAwesomeIcons.solidFrownOpen,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.red[200];
          break;
        }

      case -3:
        {
          display = new Icon(
            FontAwesomeIcons.solidFlushed,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.red[300];
          break;
        }

      case -4:
        {
          display = new Icon(
            FontAwesomeIcons.solidAngry,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.red[400];
          break;
        }

      case -5:
        {
          display = new Icon(
            FontAwesomeIcons.solidDizzy,
            color: Colors.black,
            size: 20,
          );
          containerBgCol = Colors.red;
          break;
        }

      default:
        {
          display = new Icon(
            FontAwesomeIcons.android,
            color: Colors.black,
          );
        }
    }

    return display;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview', style: _titleFont), //Top of the screen
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: _nextScreen), //creates the 'next' arrow
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
            child: Text(
              "You asked: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: Text(
              globals.decision.getText() + "?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              "Here is a breakdown of what you said: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: globals.decision.getOutcomes().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 3.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          DropdownButton<String>(
                            icon: Icon(
                              FontAwesomeIcons.caretDown,
                              color: Colors.black,
                            ),
                            iconSize: 15,
                            items: _items.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                this._itemSelected = value;
                              });
                            },
                          );

                          
                        },
                        selected: true,
                        title: Text(
                          globals.decision
                              .getOutcomes()
                              .elementAt(index)
                              .getOutcomeText(),
                          style: TextStyle(
                              fontSize: 21.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Text(
                              "Goodness: \t",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                                child: displayIcon = getGoodnessIcon(globals
                                    .decision
                                    .getOutcomes()
                                    .elementAt(index)
                                    .getGoodness())),
                            Text(
                              "\t\t\t\tLikelihood: " +
                                  globals.decision
                                      .getOutcomes()
                                      .elementAt(index)
                                      .getLikelihood()
                                      .toString() +
                                  '%',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      /*
                        Color property placed here on purpose
                        to correctly express cooresponding color with emoji
                      */
                      color: containerBgCol,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _nextScreen() {
    //navigates to the Third screen
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return SixthScreen();
    }));
  }
}
