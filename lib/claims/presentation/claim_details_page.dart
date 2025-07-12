import 'package:flutter/material.dart';

class ClaimDetailsPage extends StatelessWidget {
  const ClaimDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Claim Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Claim ID: AH1234567',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Status: Pending Review'),
            SizedBox(height: 8),
            Text('Amount: \$2,500.00'),
            SizedBox(height: 8),
            Text('Filed: 2023-10-26'),
            SizedBox(height: 24),
            Text('Description:'),
            Text('Accident on highway, minor damages.'),
          ],
        ),
      ),
    );
  }
}
