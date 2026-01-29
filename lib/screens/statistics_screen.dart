import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../services/statistics_service.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final StatisticsService _statsService = StatisticsService();
  Map<String, int>? _totalStats;
  Map<String, int>? _easyStats;
  Map<String, int>? _mediumStats;
  Map<String, int>? _difficultStats;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    setState(() => _isLoading = true);
    
    _totalStats = await _statsService.getTotalStats();
    _easyStats = await _statsService.getStatsForDifficulty('easy');
    _mediumStats = await _statsService.getStatsForDifficulty('medium');
    _difficultStats = await _statsService.getStatsForDifficulty('difficult');
    
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.statistics),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadStatistics,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Overall Statistics
                  _buildSectionHeader(l10n.overallStatistics, Icons.analytics),
                  const SizedBox(height: 12),
                  _buildStatisticsCard(
                    context: context,
                    stats: _totalStats!,
                    showBestStreak: true,
                    l10n: l10n,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Difficulty Statistics
                  _buildSectionHeader(l10n.difficultyStatistics, Icons.school),
                  const SizedBox(height: 12),
                  
                  _buildDifficultyCard(
                    context: context,
                    title: l10n.easy,
                    stats: _easyStats!,
                    color: Colors.green,
                    l10n: l10n,
                  ),
                  const SizedBox(height: 12),
                  
                  _buildDifficultyCard(
                    context: context,
                    title: l10n.medium,
                    stats: _mediumStats!,
                    color: Colors.orange,
                    l10n: l10n,
                  ),
                  const SizedBox(height: 12),
                  
                  _buildDifficultyCard(
                    context: context,
                    title: l10n.difficult,
                    stats: _difficultStats!,
                    color: Colors.red,
                    l10n: l10n,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Storage Info
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l10n.statisticsStorageInfo,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Reset Button
                  OutlinedButton.icon(
                    onPressed: _showResetDialog,
                    icon: const Icon(Icons.refresh),
                    label: Text(l10n.resetStatistics),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 24, color: const Color(0xFFF7931A)),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStatisticsCard({
    required BuildContext context,
    required Map<String, int> stats,
    required bool showBestStreak,
    required AppLocalizations l10n,
  }) {
    final correct = stats['correct'] ?? 0;
    final wrong = stats['wrong'] ?? 0;
    final total = correct + wrong;
    final percentage = _statsService.calculatePercentage(correct, total);
    final bestStreak = stats['bestStreak'] ?? 0;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(l10n.totalQuestions, total.toString(), Icons.quiz),
                _buildStatItem(l10n.correctAnswers, correct.toString(), Icons.check_circle, Colors.green),
                _buildStatItem(l10n.wrongAnswers, wrong.toString(), Icons.cancel, Colors.red),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.accuracy,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${percentage.toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _getPercentageColor(percentage),
                  ),
                ),
              ],
            ),
            if (showBestStreak) ...[
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.local_fire_department, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    l10n.bestStreak,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    bestStreak.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyCard({
    required BuildContext context,
    required String title,
    required Map<String, int> stats,
    required Color color,
    required AppLocalizations l10n,
  }) {
    final correct = stats['correct'] ?? 0;
    final wrong = stats['wrong'] ?? 0;
    final total = correct + wrong;
    final percentage = _statsService.calculatePercentage(correct, total);

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSmallStatItem(l10n.total, total.toString()),
                _buildSmallStatItem(l10n.correct, correct.toString(), Colors.green),
                _buildSmallStatItem(l10n.wrong, wrong.toString(), Colors.red),
                _buildSmallStatItem(
                  l10n.accuracy,
                  '${percentage.toStringAsFixed(1)}%',
                  _getPercentageColor(percentage),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, [Color? color]) {
    return Column(
      children: [
        Icon(icon, color: color ?? Colors.grey, size: 32),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSmallStatItem(String label, String value, [Color? color]) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Color _getPercentageColor(double percentage) {
    if (percentage >= 80) return Colors.green;
    if (percentage >= 60) return Colors.orange;
    return Colors.red;
  }

  Future<void> _showResetDialog() async {
    final l10n = AppLocalizations.of(context)!;
    
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.resetStatistics),
        content: Text(l10n.resetStatisticsConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.reset),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await _statsService.resetStatistics();
      await _loadStatistics();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.statisticsReset)),
        );
      }
    }
  }
}
