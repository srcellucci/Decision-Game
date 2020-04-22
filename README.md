# Decision-Game
Team Giraffe's decision game project for Software Engineering I.

# Change Log
3/3/20: I've reorganized the files so that this README can be updated according to recent pushes/commits. The main.dart file was also uploaded and should be shown above this file

In changes to the main.dart file, i've added the navigation to the second screen and a text field. The classes/states have been created for all the screens, they only need re-formatting.

3/23/20: [Forked a new branch to my GitHub and on my local machine, This is just a little addition in order to create the new branch.

17:15 [This is a test to see if commit signing is working correctly.]


19:20 [Added project dependent files so future pull requests or clones can be imported directly into Android Studio or VSCode without need to copy code from GitHub and create a new project.]

21:13 [Still very unfamilliar with Flutter and Dart, added a basic action button so I can work on implementing user functionality to enter multiple outcomes. Aiming to get started on that tommorow.]

3/24/20: [Added functionality required to input multiple outcomes.

21:25 [Added functionality required to navigate between all screens]

4/4/2020: [Added remove functionality to outcome screen and cleaned up the UI, added globals.dart, updated pubspec.lock and pubspec.yaml]

4/9/2020:
    03:20: 
    
        1. Forked a new branch to my personal GitHub and to have a copy on my local machine. 

        2. Added user interface elements and functionality to 'Goodness Rating' screen. to 'Decision-Game/decision _game/lib/main.dart' file Tested displaying sample outcomes.
        
        3. Updated pubspec.yaml to contain font_awesome icons integrated with flutter. Added 'import' at the top of 'Decision-Game/decision _game/lib/main.dart' file.

        4. Updated 'Decision-Game/.vscode/lauch.json' file to coincide to work on JT's machine. Was not sure on how to locate a '/bin/main.dart' path when trying to simulate application.

        5. Planning to develop 'Likelihood Ratings' screen with little stylistic features in order to further along logic integration. Also planning to test on making global variable List to contain all the outcomes. Might test into having a Map<Outcomes,List of Ratings> - might have to be handle via logic. 

        6. Commented out 'Decision-Game/main.dart' due to conflict with running debugger in VSCode.
    
4/21/2020:
  
  
    1.Refactored our existing codebase
    
    2.Implemented core logic using DecisionLogic and OutcomeOptionLogic, decision is stored as a global variable initilized once the user submits a decision.
    
    3.Linked existing screens into a functional state that works when the user follows intended input sequence, game breaks for certain edge cases.
    
    
