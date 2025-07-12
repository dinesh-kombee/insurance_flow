import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Your auto claim AX123456 has been approved.'),
              subtitle: Text('2 hours ago')),
          ListTile(
              leading: Icon(Icons.info, color: Colors.blue),
              title: Text('New documents for Home Insurance are available.'),
              subtitle: Text('Yesterday')),
          ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.orange),
              title: Text('Reminder: Life Insurance premium is due Oct 25.'),
              subtitle: Text('2 days ago')),
        ],
      ),
    );
  }
}
