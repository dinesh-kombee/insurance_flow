import 'package:flutter/material.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Documents', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey,
            child: Text('JD', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterButtons(),
            const SizedBox(height: 24),
            _buildSectionHeader('Recent Activity', onTap: () {}),
            const SizedBox(height: 16),
            _buildRecentActivities(),
            const SizedBox(height: 24),
            _buildSectionHeader('Document Types', onTap: () {}),
            const SizedBox(height: 16),
            _buildDocumentTypes(),
            const SizedBox(height: 24),
            const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildQuickActionCard(
              icon: Icons.upload,
              title: 'Upload New Document',
              subtitle: 'Quickly add a new file to your records.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Wrap(
      spacing: 8,
      children: [
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: Colors.blue[700],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text('ALL DOCUMENTS'),
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text('Policies'),
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text('Claims'),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, {required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: onTap, child: const Text('See all')),
      ],
    );
  }

  Widget _buildRecentActivities() {
    return SizedBox(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildRecentActivityCard(
            title: 'Home Policy Renewal',
            subtitle: 'Your annual home insurance for 2024.',
            date: 'Jan 20, 2024',
          ),
          _buildRecentActivityCard(
            title: 'Auto Insurance Terms',
            subtitle: 'Comprehensive 2024 terms.',
            date: 'Feb 15, 2024',
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivityCard({required String title, required String subtitle, required String date}) {
    return SizedBox(
      width: 180,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        margin: const EdgeInsets.only(right: 16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Placeholder(fallbackHeight: 80),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
              const Spacer(),
              Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentTypes() {
    final docs = [
      {'icon': Icons.description, 'title': 'Insurance Policies', 'count': '12 Documents', 'edited': 'Mar 20, 2024'},
      {'icon': Icons.insert_drive_file, 'title': 'Claims Forms', 'count': '7 Documents', 'edited': 'Mar 15, 2024'},
      {'icon': Icons.account_balance, 'title': 'Financial Statements', 'count': '24 Documents', 'edited': 'Feb 28, 2024'},
      {'icon': Icons.verified, 'title': 'Certificates', 'count': '5 Documents', 'edited': 'Jan 10, 2024'},
      {'icon': Icons.announcement, 'title': 'Announcements', 'count': '3 Documents', 'edited': 'Dec 01, 2023'},
    ];

    return Column(
      children: docs
          .map(
            (doc) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildDocumentTypeCard(
            icon: doc['icon'] as IconData,
            title: doc['title'] as String,
            count: doc['count'] as String,
            lastEdited: 'Last edited on ${doc['edited']}',
          ),
        ),
      )
          .toList(),
    );
  }

  Widget _buildDocumentTypeCard({
    required IconData icon,
    required String title,
    required String count,
    required String lastEdited,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue[50],
              child: Icon(icon, color: Colors.blue),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(count, style: const TextStyle(color: Colors.grey)),
                  Text(lastEdited, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionCard({required IconData icon, required String title, required String subtitle}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.green[50],
              child: Icon(icon, color: Colors.green),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
