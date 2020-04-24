/*
# Decision-Game
Team Giraffe's decision game project for Software Engineering I.
*/
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//Decision Game Code for Team Giraffe
import 'package:flutter/material.dart';
import 'QuestionScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ), //changes color to purple
      home: FirstScreen(),
    );
  }
}
