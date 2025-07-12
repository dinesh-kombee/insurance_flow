import 'package:flutter/material.dart';

class PoliciesListPage extends StatelessWidget {
  const PoliciesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Policies List')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
              title: Text('Auto Insurance'),
              subtitle: Text('AX123456'),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(
              title: Text('Home Insurance'),
              subtitle: Text('HM789012'),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(
              title: Text('Life Insurance'),
              subtitle: Text('LF345678'),
              trailing: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
