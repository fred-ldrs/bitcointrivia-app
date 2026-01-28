import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/quiz_result.dart';

class QuizResultScreen extends StatelessWidget {
  final QuizResult result;

  const QuizResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final percentage = result.percentage;
    
    // Emoji basierend auf Ergebnis
    String emoji;
    String resultMessage;
    if (percentage == 100) {
      emoji = '🏆';
      resultMessage = l10n.resultPerfect;
    } else if (percentage >= 80) {
      emoji = '🎉';
      resultMessage = l10n.resultExcellent;
    } else if (percentage >= 60) {
      emoji = '👍';
      resultMessage = l10n.resultGood;
    } else if (percentage >= 40) {
      emoji = '📚';
      resultMessage = l10n.resultNeedsImprovement;
    } else {
      emoji = '💪';
      resultMessage = l10n.resultKeepPracticing;
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.quizResult),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Emoji und Message
              Text(
                emoji,
                style: const TextStyle(fontSize: 80),
              ),
              const SizedBox(height: 16),
              Text(
                resultMessage,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Statistiken
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Prozentsatz
                      CircularProgressIndicator(
                        value: percentage / 100,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getColorForPercentage(percentage),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${percentage.toStringAsFixed(1)}%',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: _getColorForPercentage(percentage),
                            ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Richtige Antworten
                      _buildStatRow(
                        context,
                        Icons.check_circle,
                        l10n.correctAnswers,
                        '${result.correctAnswers}',
                        Colors.green,
                      ),
                      const SizedBox(height: 12),
                      
                      // Falsche Antworten
                      _buildStatRow(
                        context,
                        Icons.cancel,
                        l10n.wrongAnswers,
                        '${result.wrongAnswers}',
                        Colors.red,
                      ),
                      const SizedBox(height: 12),
                      
                      // Gesamt
                      _buildStatRow(
                        context,
                        Icons.quiz,
                        l10n.totalQuestions,
                        '${result.totalQuestions}',
                        Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Fehler nach Kategorie
              if (result.errorsByCategory.isNotEmpty) ...[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.category, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              l10n.errorsByCategory,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ...result.errorsByCategory.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(entry.key),
                                ),
                                Chip(
                                  label: Text('${entry.value}'),
                                  backgroundColor: Colors.red[100],
                                  labelStyle: TextStyle(color: Colors.red[900]),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Buttons
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFF7931A), // Bitcoin Orange immer
                    foregroundColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.black // Schwarzer Text im hellen Modus
                        : Colors.white, // Weißer Text im dunklen Modus
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      l10n.backToHome,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      l10n.newQuiz,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
      ],
    );
  }

  Color _getColorForPercentage(double percentage) {
    if (percentage >= 80) return Colors.green;
    if (percentage >= 60) return Colors.orange;
    return Colors.red;
  }
}
