import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  void _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support the Project'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Unterstütze Bitcoin Trivia',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Wenn dir das Projekt gefällt, kannst du es auf verschiedene Arten unterstützen.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          // Bitcoin
          ListTile(
            leading: const Icon(Icons.currency_bitcoin, color: Colors.orange),
            title: const Text('Bitcoin Spende'),
            subtitle: const Text('Unterstütze uns direkt über Lightning oder On‑Chain.'),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#bitcoin'),
          ),

          // PayPal
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('PayPal'),
            subtitle: const Text('Einfach und schnell unterstützen.'),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#paypal'),
          ),

          const SizedBox(height: 16),
          const Text(
            'Affiliate‑Programme',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text('BitBox Hardware Wallet'),
            subtitle: const Text('Empfohlen für sichere Bitcoin‑Aufbewahrung.'),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#bitbox'),
          ),

          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Ledger Wallet'),
            subtitle: const Text('Alternative Hardware‑Wallet‑Option.'),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#ledger'),
          ),

          ListTile(
            leading: const Icon(Icons.show_chart),
            title: const Text('CoinTracking'),
            subtitle: const Text('Portfolio‑Tracking und Steuer‑Tools.'),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#cointracking'),
          ),

          const SizedBox(height: 32),
          const Center(
            child: Text(
              'Danke für deine Unterstützung!',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}