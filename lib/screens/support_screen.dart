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

          // Donate Section
          Text(
            l10n.donate,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 8),

          ListTile(
            leading: const Icon(Icons.currency_bitcoin, color: Colors.orange),
            title: Text(l10n.bitcoinDonation),
            subtitle: Text(l10n.bitcoinDonationViaOpenNode),
            onTap: () => _openUrl('https://checkout.opennode.com/p/ffd4467e-e41c-4b6e-9ceb-4bd394254fe8'),
          ),

          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: Text(l10n.paypal),
            subtitle: Text(l10n.paypalDonationSubtitle),
            onTap: () => _openUrl('https://PayPal.Me/luederssolutions'),
          ),

          const SizedBox(height: 16),
          Text(
            l10n.affiliatePrograms,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 8),

          // Buy Bitcoin
          Text(
            l10n.buyBitcoin,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),

          ListTile(
            leading: const Icon(Icons.store),
            title: Text(l10n.bisonApp),
            subtitle: Text(l10n.bisonAppSubtitle),
            onTap: () => _openUrl('https://ldrs.uk/bison-bt'),
          ),

          ListTile(
            leading: const Icon(Icons.store),
            title: Text(l10n.bitvavo),
            subtitle: Text(l10n.bitvavoSubtitle),
            onTap: () => _openUrl('https://ldrs.uk/bitvavo-bt'),
          ),

          const SizedBox(height: 16),

          // Store Bitcoin
          Text(
            l10n.storeBitcoin,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),

          ListTile(
            leading: const Icon(Icons.security),
            title: Text(l10n.bitboxWallet),
            subtitle: Text(l10n.bitboxSubtitle),
            onTap: () => _openUrl('https://ldrs.uk/bitbox-bt'),
          ),

          ListTile(
            leading: const Icon(Icons.security),
            title: Text(l10n.jadeWallet),
            subtitle: Text(l10n.jadeWalletSubtitle),
            onTap: () => _openUrl('https://ldrs.uk/jade-bt'),
          ),

          ListTile(
            leading: const Icon(Icons.security),
            title: Text(l10n.ledgerWallet),
            subtitle: Text(l10n.ledgerSubtitle),
            onTap: () => _openUrl('https://ldrs.uk/ledger-bt'),
          ),

          const SizedBox(height: 16),

          // Tax and Tracking
          Text(
            l10n.taxAndTracking,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),

          ListTile(
            leading: const Icon(Icons.show_chart),
            title: Text(l10n.cointracking),
            subtitle: Text(l10n.cointrackingSubtitle),
            onTap: () => _openUrl('https://ldrs.uk/ct-bt'),
          ),

          ListTile(
            leading: const Icon(Icons.show_chart),
            title: Text(l10n.blockpit),
            subtitle: Text(l10n.blockpitSubtitle),
            onTap: () => _openUrl('https://ldrs.uk/blockpit-bt'),
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