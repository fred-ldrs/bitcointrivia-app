import 'package:flutter/material.dart';
import 'support_screen.dart';
import 'impressum_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bitcoin Trivia'),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Start Quiz'),
              ),

              const SizedBox(height: 30),

              TextButton(
                onPressed: () {},
                child: const Text('Einstellungen'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Feedback'),
              ),
              
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportScreen()),
                  );
                },
                child: const Text('Support the Project'),
              ),

              const SizedBox(height: 40),

              TextButton(
                onPressed: () {},
                child: const Text('Datenschutz'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,  
                    MaterialPageRoute(builder: (context) => ImpressumScreen()),
                  );
                },
                child: const Text('Impressum'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}