import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.supportTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            l10n.supportBitcoinTrivia,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.supportDescription,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          // Bitcoin
          ListTile(
            leading: const Icon(Icons.currency_bitcoin, color: Colors.orange),
            title: Text(l10n.bitcoinDonation),
            subtitle: Text(l10n.bitcoinDonationSubtitle),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#bitcoin'),
          ),

          // PayPal
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: Text(l10n.paypal),
            subtitle: Text(l10n.paypalSubtitle),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#paypal'),
          ),

          const SizedBox(height: 16),
          Text(
            l10n.affiliatePrograms,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: Text(l10n.bitboxWallet),
            subtitle: Text(l10n.bitboxSubtitle),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#bitbox'),
          ),

          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(l10n.ledgerWallet),
            subtitle: Text(l10n.ledgerSubtitle),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#ledger'),
          ),

          ListTile(
            leading: const Icon(Icons.show_chart),
            title: Text(l10n.cointracking),
            subtitle: Text(l10n.cointrackingSubtitle),
            onTap: () => _openUrl('https://bitcointrivia.org/support.html#cointracking'),
          ),

          const SizedBox(height: 32),
          Center(
            child: Text(
              l10n.thankYou,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}