import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsService {
  static const String _statisticsKey = 'quiz_statistics';
  
  // Singleton pattern
  static final StatisticsService _instance = StatisticsService._internal();
  factory StatisticsService() => _instance;
  StatisticsService._internal();

  SharedPreferences? _prefs;

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await _ensureStatisticsStructure();
  }

  // Ensure statistics structure exists with default values
  Future<void> _ensureStatisticsStructure() async {
    final stats = await getStatistics();
    if (stats == null || stats.isEmpty) {
      await _saveStatistics({
        'total': {'correct': 0, 'wrong': 0, 'bestStreak': 0},
        'easy': {'correct': 0, 'wrong': 0},
        'medium': {'correct': 0, 'wrong': 0},
        'difficult': {'correct': 0, 'wrong': 0},
      });
    } else {
      // Ensure all required fields exist (for update safety)
      bool needsUpdate = false;
      final updatedStats = Map<String, dynamic>.from(stats);

      // Check if total has bestStreak
      if (!updatedStats.containsKey('total')) {
        updatedStats['total'] = {'correct': 0, 'wrong': 0, 'bestStreak': 0};
        needsUpdate = true;
      } else if (!updatedStats['total'].containsKey('bestStreak')) {
        updatedStats['total']['bestStreak'] = 0;
        needsUpdate = true;
      }

      // Ensure all difficulty levels exist
      for (final difficulty in ['easy', 'medium', 'difficult']) {
        if (!updatedStats.containsKey(difficulty)) {
          updatedStats[difficulty] = {'correct': 0, 'wrong': 0};
          needsUpdate = true;
        }
      }

      if (needsUpdate) {
        await _saveStatistics(updatedStats);
      }
    }
  }

  // Get all statistics
  Future<Map<String, dynamic>?> getStatistics() async {
    if (_prefs == null) await init();
    final statsString = _prefs!.getString(_statisticsKey);
    if (statsString == null) return null;
    return json.decode(statsString) as Map<String, dynamic>;
  }

  // Save statistics
  Future<void> _saveStatistics(Map<String, dynamic> stats) async {
    if (_prefs == null) await init();
    await _prefs!.setString(_statisticsKey, json.encode(stats));
  }

  // Update statistics after answering a question
  Future<void> recordAnswer({
    required String difficulty,
    required bool isCorrect,
  }) async {
    final stats = await getStatistics() ?? {};
    
    // Update total
    if (!stats.containsKey('total')) {
      stats['total'] = {'correct': 0, 'wrong': 0, 'bestStreak': 0};
    }
    if (isCorrect) {
      stats['total']['correct'] = (stats['total']['correct'] ?? 0) + 1;
    } else {
      stats['total']['wrong'] = (stats['total']['wrong'] ?? 0) + 1;
    }

    // Update difficulty level
    if (!stats.containsKey(difficulty)) {
      stats[difficulty] = {'correct': 0, 'wrong': 0};
    }
    if (isCorrect) {
      stats[difficulty]['correct'] = (stats[difficulty]['correct'] ?? 0) + 1;
    } else {
      stats[difficulty]['wrong'] = (stats[difficulty]['wrong'] ?? 0) + 1;
    }

    await _saveStatistics(stats);
  }

  // Update best streak
  Future<void> updateBestStreak(int streak) async {
    final stats = await getStatistics() ?? {};
    
    if (!stats.containsKey('total')) {
      stats['total'] = {'correct': 0, 'wrong': 0, 'bestStreak': 0};
    }
    
    final currentBest = stats['total']['bestStreak'] ?? 0;
    if (streak > currentBest) {
      stats['total']['bestStreak'] = streak;
      await _saveStatistics(stats);
    }
  }

  // Get statistics for a specific difficulty
  Future<Map<String, int>> getStatsForDifficulty(String difficulty) async {
    final stats = await getStatistics();
    if (stats == null || !stats.containsKey(difficulty)) {
      return {'correct': 0, 'wrong': 0};
    }
    return {
      'correct': stats[difficulty]['correct'] ?? 0,
      'wrong': stats[difficulty]['wrong'] ?? 0,
    };
  }

  // Get total statistics
  Future<Map<String, int>> getTotalStats() async {
    final stats = await getStatistics();
    if (stats == null || !stats.containsKey('total')) {
      return {'correct': 0, 'wrong': 0, 'bestStreak': 0};
    }
    return {
      'correct': stats['total']['correct'] ?? 0,
      'wrong': stats['total']['wrong'] ?? 0,
      'bestStreak': stats['total']['bestStreak'] ?? 0,
    };
  }

  // Calculate percentage
  double calculatePercentage(int correct, int total) {
    if (total == 0) return 0.0;
    return (correct / total) * 100;
  }

  // Export statistics as JSON string (for manual backup)
  Future<String> exportStatistics() async {
    final stats = await getStatistics();
    return json.encode(stats ?? {});
  }

  // Import statistics from JSON string (for restore)
  Future<bool> importStatistics(String jsonString) async {
    try {
      final stats = json.decode(jsonString) as Map<String, dynamic>;
      await _saveStatistics(stats);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Reset all statistics
  Future<void> resetStatistics() async {
    await _saveStatistics({
      'total': {'correct': 0, 'wrong': 0, 'bestStreak': 0},
      'easy': {'correct': 0, 'wrong': 0},
      'medium': {'correct': 0, 'wrong': 0},
      'difficult': {'correct': 0, 'wrong': 0},
    });
  }
}
