import 'package:flutter/material.dart';

class PolicyDetailsPage extends StatelessWidget {
  const PolicyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Policy Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Policy No: AX123456',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Type: Auto Insurance'),
            SizedBox(height: 8),
            Text('Status: Active'),
            SizedBox(height: 8),
            Text('Coverage: \$20,000'),
            SizedBox(height: 24),
            Text('Details:'),
            Text('Comprehensive auto insurance for 2024.'),
          ],
        ),
      ),
    );
  }
}
