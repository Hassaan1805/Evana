import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  final String userName = 'Sarah Johnson';
  final String userInitial = 'SJ';
  final String rating = '4.8';
  final String phone = '+91 98765 43210';
  final String email = 'sarah.j@email.com';
  final String memberSince = 'March 2024';
  final int totalRides = 67;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Text(
                    userInitial,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    avatar: Icon(Icons.star, color: Colors.orange.shade600, size: 18),
                    label: Text('Rating: $rating'),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    side: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                  const SizedBox(height: 24),
                  _buildDetailRow(title: 'Phone:', value: phone),
                  const Divider(height: 24),
                  _buildDetailRow(title: 'Email:', value: email),
                  const Divider(height: 24),
                  _buildDetailRow(title: 'Member Since:', value: memberSince),
                  const Divider(height: 24),
                  _buildDetailRow(title: 'Total Rides:', value: totalRides.toString()),
                  const SizedBox(height: 32),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}