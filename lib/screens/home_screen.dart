import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'support_screen.dart';
import 'settings_screen.dart';
import 'quiz_config_screen.dart';
import 'database_debug_screen.dart';
import 'statistics_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/BitcoinTriviaV3.png',
                width: 180,
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizConfigScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7931A),
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  minimumSize: const Size(200, 48),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(l10n.startQuiz),
              ),

              const SizedBox(height: 30),

              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StatisticsScreen()),
                  );
                },
                icon: const Icon(Icons.bar_chart),
                label: Text(l10n.statistics),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : null,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  minimumSize: const Size(200, 48),
                ),
              ),
              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
                icon: const Icon(Icons.settings),
                label: Text(l10n.settings),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : null,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  minimumSize: const Size(200, 48),
                ),
              ),
              const SizedBox(height: 12),
              
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportScreen()),
                  );
                },
                icon: const Icon(Icons.favorite_border),
                label: Text(l10n.supportProject),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : null,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  minimumSize: const Size(200, 48),
                ),
              ),

              if (kDebugMode) ...[
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DatabaseDebugScreen()),
                    );
                  },
                  child: const Text('🔧 Database Debug (Debug-Build)'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
