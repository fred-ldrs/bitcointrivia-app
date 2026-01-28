import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/question.dart';
import '../models/quiz_config.dart';
import '../models/quiz_result.dart';
import '../services/database_service.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  final QuizConfig config;

  const QuizScreen({super.key, required this.config});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final DatabaseService _dbService = DatabaseService();
  
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  bool _hasAnswered = false;
  
  // Für gemischte Antworten
  List<String> _currentShuffledOptions = [];
  int _currentCorrectIndex = 0;
  
  // Tracking für Ergebnisse
  int _correctAnswers = 0;
  final Map<String, int> _errorsByCategory = {};
  
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await _dbService.loadQuestions(widget.config);
      
      if (questions.isEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.noQuestionsAvailable),
          ),
        );
        Navigator.pop(context);
        return;
      }
      
      setState(() {
        _questions = questions;
        _shuffleCurrentQuestion();
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      Navigator.pop(context);
    }
  }
  
  void _shuffleCurrentQuestion() {
    final currentQuestion = _questions[_currentQuestionIndex];
    final shuffled = currentQuestion.getAllAnswersShuffled();
    _currentShuffledOptions = shuffled['options'] as List<String>;
    _currentCorrectIndex = shuffled['correctIndex'] as int;
  }

  void _selectAnswer(int answerIndex) {
    if (_hasAnswered) return;

    setState(() {
      _selectedAnswerIndex = answerIndex;
      _hasAnswered = true;

      final isCorrect = answerIndex == _currentCorrectIndex;

      if (isCorrect) {
        _correctAnswers++;
      } else {
        // Fehler in dieser Kategorie zählen
        final category = _questions[_currentQuestionIndex].category;
        _errorsByCategory[category] = (_errorsByCategory[category] ?? 0) + 1;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
        _hasAnswered = false;
        _shuffleCurrentQuestion();
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    final result = QuizResult(
      totalQuestions: _questions.length,
      correctAnswers: _correctAnswers,
      errorsByCategory: _errorsByCategory,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(result: result),
      ),
    );
  }

  Color? _getAnswerColor(int answerIndex) {
    if (!_hasAnswered) return null;

    if (answerIndex == _currentCorrectIndex) {
      return Colors.green;
    } else if (answerIndex == _selectedAnswerIndex) {
      return Colors.red;
    }
    return null;
  }

  IconData? _getAnswerIcon(int answerIndex) {
    if (!_hasAnswered) return null;

    if (answerIndex == _currentCorrectIndex) {
      return Icons.check_circle;
    } else if (answerIndex == _selectedAnswerIndex) {
      return Icons.cancel;
    }
    return null;
  }

  Color? _getAnswerIconColor(int answerIndex) {
    if (!_hasAnswered) return null;

    if (answerIndex == _currentCorrectIndex) {
      return Colors.green;
    } else if (answerIndex == _selectedAnswerIndex) {
      return Colors.red;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.quiz)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / _questions.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(l10n.quitQuiz),
            content: Text(l10n.quitQuizMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(l10n.quit),
              ),
            ],
          ),
        );

        if (shouldPop == true && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.questionNumber(_currentQuestionIndex + 1, _questions.length)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFF7931A)), // Bitcoin Orange
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Kategorie und Schwierigkeit
              Row(
                children: [
                  Chip(
                    label: Text(currentQuestion.category),
                    avatar: const Icon(Icons.category, size: 18),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    label: Text(_getDifficultyName(currentQuestion.difficulty, l10n)),
                    avatar: const Icon(Icons.speed, size: 18),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Frage
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    currentQuestion.questionText,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Antworten
              Expanded(
                child: ListView.builder(
                  itemCount: _currentShuffledOptions.length,
                  itemBuilder: (context, index) {
                    final answer = _currentShuffledOptions[index];
                    final color = _getAnswerColor(index);
                    final icon = _getAnswerIcon(index);
                    final iconColor = _getAnswerIconColor(index);
                    final hasColoredBackground = color != null;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: FilledButton.tonal(
                        onPressed: _hasAnswered ? null : () => _selectAnswer(index),
                        style: FilledButton.styleFrom(
                          backgroundColor: color,
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.centerLeft,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                answer,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: hasColoredBackground ? Colors.black : null,
                                ),
                              ),
                            ),
                            if (icon != null) Icon(icon, color: iconColor),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Weiter-Button
              if (_hasAnswered)
                FilledButton(
                  onPressed: _nextQuestion,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFF7931A), // Bitcoin Orange immer
                    foregroundColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.black // Schwarzer Text im hellen Modus
                        : Colors.white, // Weißer Text im dunklen Modus
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _currentQuestionIndex < _questions.length - 1
                          ? l10n.nextQuestion
                          : l10n.finishQuiz,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }


  String _getDifficultyName(String difficulty, AppLocalizations l10n) {
    switch (difficulty) {
      case 'easy':
        return l10n.difficultyEasy;
      case 'normal':
        return l10n.difficultyNormal;
      case 'difficult':
        return l10n.difficultyDifficult;
      default:
        return difficulty;
    }
  }
}
