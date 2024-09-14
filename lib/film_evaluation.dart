
class FilmEvaluation {
  final int finalQuality;
  final int boxOffice;

  FilmEvaluation(this.finalQuality, this.boxOffice);
}

FilmEvaluation evaluateFilm(int budget, int quality, int marketing, int actorReputation) {
  final adjustedQuality = (quality + actorReputation ~/ 2).clamp(0, 100);
  final boxOffice = (adjustedQuality * budget ~/ 10) + (100000 + marketing);
  return FilmEvaluation(adjustedQuality, boxOffice);
}
    