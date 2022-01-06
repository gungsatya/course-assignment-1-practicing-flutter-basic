class GuessDto{
  String guessText;
  String response;
  bool isItTrue;

  GuessDto({required this.guessText, this.response = 'Nope', this.isItTrue = false});
}