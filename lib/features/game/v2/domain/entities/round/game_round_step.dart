enum GameRoundStep {
  waiting,
  drawing,
  voting,
  answering,
  ending;

  bool get isPlaying => this != ending;
}
