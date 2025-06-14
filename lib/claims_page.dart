import 'package:flutter/material.dart';

class ClaimsPage extends StatelessWidget {
  const ClaimsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CLAIMS', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('File a New Claim'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 15),
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for claims...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const SectionHeader(title: 'Recently Filed Claims'),
            const SizedBox(height: 16),
            ClaimCard(
              icon: Icons.directions_car,
              title: 'Auto Claim',
              claimId: 'AH1234567',
              status: 'Pending Review',
              statusColor: Colors.orange,
              dateFiled: '2023-10-26',
              lastUpdate: '2023-11-01',
              amount: '\$2,500.00',
              hasUploadButton: true,
            ),
            ClaimCard(
              icon: Icons.home,
              title: 'Home Claim',
              claimId: 'HM9876543',
              status: 'Processing',
              statusColor: Colors.blue,
              dateFiled: '2023-09-15',
              lastUpdate: '2023-10-20',
              amount: '\$15,000.00',
            ),
            ClaimCard(
              icon: Icons.description,
              title: 'Other Claim',
              claimId: 'OT9012345',
              status: 'Processing',
              statusColor: Colors.blue,
              dateFiled: '2023-05-20',
              lastUpdate: '2023-05-25',
              amount: '\$1,200.00',
            ),
            const SizedBox(height: 30),
            const SectionHeader(title: 'Archived Claims'),
            const SizedBox(height: 16),
            ClaimCard(
              icon: Icons.favorite,
              title: 'Health Claim',
              claimId: 'HL2345678',
              status: 'Approved',
              statusColor: Colors.green,
              dateFiled: '2023-08-01',
              lastUpdate: '2023-08-10',
              amount: '\$750.00',
            ),
            ClaimCard(
              icon: Icons.directions_car,
              title: 'Auto Claim',
              claimId: 'AH17654321',
              status: 'Closed',
              statusColor: Colors.grey,
              dateFiled: '2023-07-05',
              lastUpdate: '2023-07-25',
              amount: '\$500.00',
            ),
            ClaimCard(
              icon: Icons.home,
              title: 'Home Claim',
              claimId: 'HM1122334',
              status: 'Denied',
              statusColor: Colors.red,
              dateFiled: '2023-06-10',
              lastUpdate: '2023-06-30',
              amount: '\$3,000.00',
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ClaimCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String claimId;
  final String status;
  final Color statusColor;
  final String dateFiled;
  final String lastUpdate;
  final String amount;
  final bool hasUploadButton;

  const ClaimCard({
    super.key,
    required this.icon,
    required this.title,
    required this.claimId,
    required this.status,
    required this.statusColor,
    required this.dateFiled,
    required this.lastUpdate,
    required this.amount,
    this.hasUploadButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blue, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Chip(
                        label: Text(status),
                        backgroundColor: statusColor.withOpacity(0.15),
                        labelStyle: TextStyle(color: statusColor),
                      ),
                    ],
                  ),
                  Text('Claim ID: $claimId', style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _InfoLabel(label: 'Date Filed', value: dateFiled),
                      _InfoLabel(label: 'Last Update', value: lastUpdate),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Amount Claimed: $amount',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (hasUploadButton)
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.upload_file),
                          label: const Text('Upload Documents'),
                        ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View Details'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InfoLabel extends StatelessWidget {
  final String label;
  final String value;

  const _InfoLabel({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
