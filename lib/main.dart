import 'package:flutter/material.dart';

import 'screens/compound_interest_screen.dart';
import 'screens/home_screen.dart';
import 'screens/simple_interest_screen.dart';

void main() {
  runApp(const InterestCalculatorApp());
}

class InterestCalculatorApp extends StatelessWidget {
  const InterestCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interest Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        SimpleInterestScreen.routeName: (_) => const SimpleInterestScreen(),
        CompoundInterestScreen.routeName: (_) => const CompoundInterestScreen(),
      },
    );
  }
}
