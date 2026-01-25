import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const BitcoinTriviaApp());
}

class BitcoinTriviaApp extends StatelessWidget {
  const BitcoinTriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Trivia',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}