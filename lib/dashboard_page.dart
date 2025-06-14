import 'package:flutter/material.dart';
import 'package:insurance_flow/profile_page.dart';
import 'claims_page.dart';
import 'documents_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    ClaimsPage(),
    DocumentsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.file_copy_outlined),
            selectedIcon: Icon(Icons.file_copy),
            label: 'Claims',
          ),
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            selectedIcon: Icon(Icons.description),
            label: 'Documents',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your insurance overview at a glance.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            _buildCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Coverage', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('+5.2% last month', style: TextStyle(color: Colors.green)),
                    ],
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Manage Funds'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildActionButton(Icons.file_copy, 'File New Claim', () {}),
                _buildActionButton(Icons.account_balance_wallet, 'View Policies', () {}),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Policies', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildPolicyCard('Auto Insurance', 'AX123456', 'Active', Colors.green),
                _buildPolicyCard('Home Insurance', 'HM789012', 'Active', Colors.green),
                _buildPolicyCard('Life Insurance', 'LF345678', 'Pending', Colors.orange),
              ],
            ),
            const SizedBox(height: 24),
            _buildProgressCard(),
            const SizedBox(height: 24),
            _buildBarGraph(),
            const SizedBox(height: 24),
            _buildNotification(Icons.check_circle, Colors.green, 'Your auto claim AX123456 has been approved.', '2 hours ago'),
            _buildNotification(Icons.info, Colors.blue, 'New documents for Home Insurance are available.', 'Yesterday'),
            _buildNotification(Icons.calendar_today, Colors.orange, 'Reminder: Life Insurance premium is due Oct 25.', '2 days ago'),
          ],
        ),
      ),
    );
  }

  static Widget _buildCard({required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  static Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return SizedBox(
      width: 180,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        icon: Icon(icon),
        label: Text(label),
        onPressed: onTap,
      ),
    );
  }

  static Widget _buildPolicyCard(String title, String number, String status, Color color) {
    return SizedBox(
      width: 400,
      child: _buildCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Policy No: $number', style: const TextStyle(color: Colors.grey)),
              ],
            ),
            Chip(
              label: Text(status),
              backgroundColor: color.withOpacity(0.1),
              labelStyle: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildProgressCard() {
    return _buildCard(
      child: Row(
        children: [
          const CircularProgressIndicator(value: 0.7, strokeWidth: 6, backgroundColor: Colors.grey),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('7 of 10 Claims', style: TextStyle(fontSize: 16)),
                Text('70% Complete', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.arrow_forward_ios), onPressed: () {}),
        ],
      ),
    );
  }

  static Widget _buildBarGraph() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 32,
            children: [
              _buildBar(height: 80, label: 'Home'),
              _buildBar(height: 40, label: 'Health'),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.square, color: Colors.blue, size: 16),
              SizedBox(width: 8),
              Text('Count', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildBar({required double height, required String label}) {
    return Column(
      children: [
        Container(width: 50, height: height, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(6))),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  static Widget _buildNotification(IconData icon, Color color, String title, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: _buildCard(
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16)),
                  Text(time, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
