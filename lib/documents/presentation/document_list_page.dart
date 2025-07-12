import 'package:flutter/material.dart';

class DocumentListPage extends StatelessWidget {
  const DocumentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Documents')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
              title: Text('Insurance Policy.pdf'),
              subtitle: Text('Mar 20, 2024'),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(
              title: Text('Claim Form.docx'),
              subtitle: Text('Mar 15, 2024'),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(
              title: Text('Financial Statement.xlsx'),
              subtitle: Text('Feb 28, 2024'),
              trailing: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
