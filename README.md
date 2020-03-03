/* 
# Decision-Game
Team Giraffe's decsion game project for Software Engineering I.

Andrew S.
Hi, it's JT :)

It's dangerous to go alone! Take this --|==>
*/

// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//Decision Game Code for Team Giraffe

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ), //changes color to purple
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to the Decision Game'),  //Top of app screen
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),  //Margins
          child: TextFormField(
            decoration: InputDecoration(
                labelText: 'Should I...'
            ), //Text field for the question
            style: _biggerFont,  //changes font size
          ),
          ),
          //child:

        ),
      );
  }
}