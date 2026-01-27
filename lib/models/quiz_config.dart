class QuizConfig {
  final String difficulty; // easy, normal, difficult
  final List<String> categories;
  final int numberOfQuestions;
  final String language;

  QuizConfig({
    required this.difficulty,
    required this.categories,
    required this.numberOfQuestions,
    required this.language,
  });

  // Standard-Konfiguration
  factory QuizConfig.defaultConfig(String language) {
    return QuizConfig(
      difficulty: 'easy',
      categories: ['General Knowledge', 'History', 'Tech', 'Culture'],
      numberOfQuestions: 10,
      language: language,
    );
  }

  QuizConfig copyWith({
    String? difficulty,
    List<String>? categories,
    int? numberOfQuestions,
    String? language,
  }) {
    return QuizConfig(
      difficulty: difficulty ?? this.difficulty,
      categories: categories ?? this.categories,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      language: language ?? this.language,
    );
  }
}
