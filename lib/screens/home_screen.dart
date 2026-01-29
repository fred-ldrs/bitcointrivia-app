import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'support_screen.dart';
import 'impressum_screen.dart';
import 'settings_screen.dart';
import 'privacy_screen.dart';
import 'quiz_config_screen.dart';
import 'database_debug_screen.dart';
import 'feedback_screen.dart';
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
                  backgroundColor: const Color(0xFFF7931A), // Bitcoin Orange immer
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black // Schwarzer Text im hellen Modus
                      : Colors.white, // Weißer Text im dunklen Modus
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(l10n.startQuiz),
              ),

              const SizedBox(height: 30),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StatisticsScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : null,
                ),
                child: Text(l10n.statistics),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : null,
                ),
                child: Text(l10n.settings),
              ),
              
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : null,
                ),
                child: Text(l10n.supportProject),
              ),

              // Debug Button (nur in Debug-Builds sichtbar)
              if (kDebugMode)
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
          ),
        ),
      ),
    );
  }
}