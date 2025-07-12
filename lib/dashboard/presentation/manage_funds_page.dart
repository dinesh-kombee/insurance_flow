import 'package:flutter/material.dart';

class ManageFundsPage extends StatelessWidget {
  const ManageFundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Funds')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your current balance:'),
            const SizedBox(height: 8),
            const Text(' 2,500.00',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Funds'),
            ),
          ],
        ),
      ),
    );
  }
}
