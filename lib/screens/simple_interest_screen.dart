import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatefulWidget {
  static const routeName = '/simple';
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final _principalController = TextEditingController();
  final _rateController = TextEditingController();
  final _timeController = TextEditingController();
  double? _result;
  String? _error;

  void _calculate() {
    final p = double.tryParse(_principalController.text.replaceAll(',', ''));
    final r = double.tryParse(_rateController.text.replaceAll(',', ''));
    final t = double.tryParse(_timeController.text.replaceAll(',', ''));

    if (p == null || r == null || t == null || p < 0 || r < 0 || t < 0) {
      setState(() {
        _error = 'Please enter valid non-negative values for all fields.';
        _result = null;
      });
      return;
    }

    setState(() {
      _error = null;
      _result = (p * r * t) / 100;
    });
  }

  void _reset() {
    _principalController.clear();
    _rateController.clear();
    _timeController.clear();
    setState(() {
      _result = null;
      _error = null;
    });
  }

  @override
  void dispose() {
    _principalController.dispose();
    _rateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Interest')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Simple Interest Calculator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the principal amount, rate of interest, and time to compute simple interest.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            _buildTextField(controller: _principalController, label: 'Principal Amount', suffixText: '₹'),
            const SizedBox(height: 16),
            _buildTextField(controller: _rateController, label: 'Rate of Interest', suffixText: '%'),
            const SizedBox(height: 16),
            _buildTextField(controller: _timeController, label: 'Time (years)', suffixText: 'yrs'),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calculate,
                    child: const Text('Calculate'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: _reset,
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.redAccent, fontSize: 16)),
            if (_result != null) ...[
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: Colors.indigo.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Result', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text('Simple Interest: ₹${_result!.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? suffixText,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffixText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
