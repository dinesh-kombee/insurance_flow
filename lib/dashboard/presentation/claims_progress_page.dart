import 'package:flutter/material.dart';

class ClaimsProgressPage extends StatelessWidget {
  const ClaimsProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Claims Progress')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('7 of 10 Claims Completed'),
            SizedBox(height: 16),
            LinearProgressIndicator(value: 0.7),
          ],
        ),
      ),
    );
  }
}
