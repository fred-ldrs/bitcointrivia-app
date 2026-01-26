import 'package:flutter/material.dart';

class ImpressumScreen extends StatelessWidget {
  const ImpressumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impressum'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Impressum',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Angaben gemäß § 5 DDG',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Frederik Lüders',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'c/o Impressumservice Dein-Impressum\n'
            'Stettiner Straße 41\n'
            '35410 Hungen\n'
            'Deutschland',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.phone, size: 20, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '015679 683592',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.email, size: 20, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'info@bitcointrivia.org',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Verantwortlich für den Inhalt nach § 55 Abs. 2 RStV',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Frederik Lüders\n'
            'c/o Impressumservice Dein-Impressum\n'
            'Stettiner Straße 41\n'
            '35410 Hungen\n'
            'Deutschland',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
