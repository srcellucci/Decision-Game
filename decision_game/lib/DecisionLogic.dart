
import 'package:decisiongame/OutcomeOptionLogic.dart';

class DecisionLogic{
   Set<OutcomeOptionLogic> _outcomes;
   double _utility;
   String _text;

   DecisionLogic(){
     _text = "";
     _utility = 0;
     _outcomes = new Set<OutcomeOptionLogic>();
   }
   DecisionLogic.justText(String text){
     this._text = text;
     _utility = 0;
     _outcomes = new Set<OutcomeOptionLogic>();
   }
   DecisionLogic.textAndOutcomes(String text, Set<OutcomeOptionLogic> outcomes){
     this._text = text;
     this._outcomes = outcomes;
     _utility = 0;
   }

   void addOutcome(OutcomeOptionLogic outcome){
     _outcomes.add(outcome);
   }

   void setOutcomes(Set<OutcomeOptionLogic> outcomes){
     this._outcomes = outcomes;
   }

   void setUtility(double utility){
     this._utility = utility;
   }

   double getUtility(){
     return _utility;
   }

   String getText(){
     return _text;
   }

   Set<OutcomeOptionLogic> getOutcomes(){
     return _outcomes;
   }

   double calcExpectedUtil(){
     for(OutcomeOptionLogic outcome in _outcomes){
        _utility += (outcome.getGoodness() * outcome.getLikelihood());
     }
     return _utility;
     }




}
