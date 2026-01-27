class QuizResult {
  final int totalQuestions;
  final int correctAnswers;
  final Map<String, int> errorsByCategory; // Kategorie -> Anzahl Fehler

  QuizResult({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.errorsByCategory,
  });

  int get wrongAnswers => totalQuestions - correctAnswers;

  List<String> get categoriesWithErrors => errorsByCategory.keys.toList();

  bool get isPerfect => correctAnswers == totalQuestions;

  double get percentage => (correctAnswers / totalQuestions) * 100;
}
