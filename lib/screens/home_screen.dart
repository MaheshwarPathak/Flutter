import 'package:flutter/material.dart';

import '../widgets/calculator_card.dart';
import 'compound_interest_screen.dart';
import 'simple_interest_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Student!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Choose a calculator to compute simple interest or compound interest based on the values you enter.',
              style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 3.4,
                mainAxisSpacing: 16,
                children: [
                  CalculatorCard(
                    title: 'Simple Interest',
                    subtitle: 'Calculate interest using P × R × T / 100',
                    icon: Icons.calculate,
                    color: Colors.indigo,
                    onTap: () => Navigator.pushNamed(context, SimpleInterestScreen.routeName),
                  ),
                  CalculatorCard(
                    title: 'Compound Interest',
                    subtitle: 'Calculate interest with compounding frequency',
                    icon: Icons.autorenew,
                    color: Colors.teal,
                    onTap: () => Navigator.pushNamed(context, CompoundInterestScreen.routeName),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
