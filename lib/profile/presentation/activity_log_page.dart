import 'package:flutter/material.dart';

class ActivityLogPage extends StatelessWidget {
  const ActivityLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Log')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
              leading: Icon(Icons.login),
              title: Text('Logged In'),
              subtitle: Text('Today at 10:30 AM')),
          ListTile(
              leading: Icon(Icons.upload),
              title: Text('Document Uploaded'),
              subtitle: Text('Yesterday at 3:15 PM')),
          ListTile(
              leading: Icon(Icons.description),
              title: Text('Claim Filed'),
              subtitle: Text('June 10, 2025 at 9:00 AM')),
        ],
      ),
    );
  }
}
