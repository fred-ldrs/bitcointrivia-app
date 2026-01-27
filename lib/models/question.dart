class Question {
  final String id;
  final String questionText;
  final List<String> options; // option1, option2, option3, option4
  final int correctAnswerIndex; // 0-3
  final String difficulty;
  final String category;
  final String? language;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.difficulty,
    required this.category,
    this.language,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as String,
      questionText: map['question'] as String,
      options: [
        map['option1'] as String,
        map['option2'] as String,
        map['option3'] as String,
        map['option4'] as String,
      ],
      correctAnswerIndex: map['answer'] as int,
      difficulty: map['difficulty'] as String,
      category: map['category'] as String,
      language: map.containsKey('lang') ? map['lang'] as String? : null,
    );
  }

  /// Gibt alle Antwortoptionen in zufälliger Reihenfolge zurück
  /// und merkt sich die neue Position der richtigen Antwort
  Map<String, dynamic> getAllAnswersShuffled() {
    final List<MapEntry<int, String>> indexedOptions = [];
    for (int i = 0; i < options.length; i++) {
      indexedOptions.add(MapEntry(i, options[i]));
    }
    
    indexedOptions.shuffle();
    
    int newCorrectIndex = 0;
    final shuffledOptions = <String>[];
    for (int i = 0; i < indexedOptions.length; i++) {
      shuffledOptions.add(indexedOptions[i].value);
      if (indexedOptions[i].key == correctAnswerIndex) {
        newCorrectIndex = i;
      }
    }
    
    return {
      'options': shuffledOptions,
      'correctIndex': newCorrectIndex,
    };
  }
  
  String get correctAnswer => options[correctAnswerIndex];
}
