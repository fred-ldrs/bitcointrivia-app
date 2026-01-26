import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/locale_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.language),
            subtitle: Text(_getLanguageName(localeProvider.locale, l10n)),
          ),
          const SizedBox(height: 8),
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
}
