
class OutcomeOptionLogic{
  String outcomeText;
  int goodness;
  int likelihood;

  OutcomeOptionLogic(String outcomeText){
       this.outcomeText = outcomeText;
       goodness = 0;
       likelihood = 50;
  }
  void setGoodness(int goodness) {
    this.goodness = goodness;
  }

  int getGoodness() {
    return this.goodness;
  }

  void setOutcomeText(String text) {
    this.outcomeText = text;
  }

  String getOutcomeText(){
    return this.outcomeText;
  }

  void setLikelihood(int likelihood){
    this.likelihood = likelihood;
  }

  int getLikelihood()
  {
    return this.likelihood;
  }
}