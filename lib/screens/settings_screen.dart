import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/locale_provider.dart';
import '../providers/theme_provider.dart';
import 'privacy_screen.dart';
import 'impressum_screen.dart';
import 'feedback_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Language Section
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.language),
            subtitle: Text(_getLanguageName(localeProvider.locale, l10n)),
            visualDensity: VisualDensity.compact,
          ),
          RadioListTile<Locale>(
            title: Text(l10n.languageEnglish),
            value: const Locale('en'),
            groupValue: localeProvider.locale,
            onChanged: (Locale? value) {
              if (value != null) {
                localeProvider.setLocale(value);
              }
            },
          ),
          RadioListTile<Locale>(
            title: Text(l10n.languageGerman),
            value: const Locale('de'),
            groupValue: localeProvider.locale,
            onChanged: (Locale? value) {
              if (value != null) {
                localeProvider.setLocale(value);
              }
            },
          ),
          RadioListTile<Locale>(
            title: Text(l10n.languageFrench),
            value: const Locale('fr'),
            groupValue: localeProvider.locale,
            onChanged: (Locale? value) {
              if (value != null) {
                localeProvider.setLocale(value);
              }
            },
          ),
          
          const Divider(height: 16),
          
          // Theme Section
          ListTile(
            leading: const Icon(Icons.palette),
            title: Text(l10n.theme),
            subtitle: Text(_getThemeName(themeProvider.themePreference, l10n)),
            visualDensity: VisualDensity.compact,
          ),
          RadioListTile<ThemePreference>(
            title: Text(l10n.themeLight),
            value: ThemePreference.light,
            groupValue: themeProvider.themePreference,
            onChanged: (ThemePreference? value) {
              if (value != null) {
                themeProvider.setThemePreference(value);
              }
            },
          ),
          RadioListTile<ThemePreference>(
            title: Text(l10n.themeDark),
            value: ThemePreference.dark,
            groupValue: themeProvider.themePreference,
            onChanged: (ThemePreference? value) {
              if (value != null) {
                themeProvider.setThemePreference(value);
              }
            },
          ),
          RadioListTile<ThemePreference>(
            title: Text(l10n.themeSystem),
            value: ThemePreference.system,
            groupValue: themeProvider.themePreference,
            onChanged: (ThemePreference? value) {
              if (value != null) {
                themeProvider.setThemePreference(value);
              }
            },
          ),
          
          const Divider(height: 16),
          
          // Feedback & Info Section
          ListTile(
            leading: const Icon(Icons.comment_outlined),
            title: Text(l10n.feedback),
            visualDensity: VisualDensity.compact,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackScreen()),
              );
            },
          ),
          
          const Divider(height: 16),
          
          // Legal Section
          ListTile(
            leading: const Icon(Icons.gavel),
            title: Text(l10n.legal),
            visualDensity: VisualDensity.compact,
          ),
          ListTile(
            title: Text(l10n.privacy),
            leading: const Icon(Icons.privacy_tip_outlined),
            visualDensity: VisualDensity.compact,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyScreen()),
              );
            },
          ),
          ListTile(
            title: Text(l10n.impressum),
            leading: const Icon(Icons.info_outline),
            visualDensity: VisualDensity.compact,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImpressumScreen()),
              );
            },
          ),
          
          const Divider(height: 16),
          
          // Statistics Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
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
          ),
        ],
      ),
    );
  }

  String _getLanguageName(Locale locale, AppLocalizations l10n) {
    switch (locale.languageCode) {
      case 'en':
        return l10n.languageEnglish;
      case 'de':
        return l10n.languageGerman;
      case 'fr':
        return l10n.languageFrench;
      default:
        return l10n.languageEnglish;
    }
  }
  
  String _getThemeName(ThemePreference preference, AppLocalizations l10n) {
    switch (preference) {
      case ThemePreference.light:
        return l10n.themeLight;
      case ThemePreference.dark:
        return l10n.themeDark;
      case ThemePreference.system:
        return l10n.themeSystem;
    }
  }
}
