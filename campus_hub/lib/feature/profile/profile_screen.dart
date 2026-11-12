import 'package:flutter/material.dart';

import '../../core/app_routes.dart';
import '../../core/app_theme.dart';
import '../core/presentation/campus_hub_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      drawer: const CampusHubDrawer(selectedRoute: AppRoutes.profile),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'My Profile',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: AppTheme.navy,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.navy, AppTheme.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_rounded,
                    size: 58,
                    color: AppTheme.primary,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Faizan Iqbal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '2502141@students.au.edu.pk',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 14),
                Chip(
                  avatar: Icon(
                    Icons.school_rounded,
                    size: 18,
                    color: AppTheme.primary,
                  ),
                  label: Text('Campus Student'),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Student Information',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppTheme.navy,
            ),
          ),
          const SizedBox(height: 14),
          const _ProfileInfoCard(
            icon: Icons.school_outlined,
            title: 'Program',
            value: 'Computer Science',
            color: Colors.blue,
          ),
          const _ProfileInfoCard(
            icon: Icons.calendar_month_outlined,
            title: 'Semester',
            value: 'Semester 3',
            color: Colors.purple,
          ),
          const _ProfileInfoCard(
            icon: Icons.account_balance_outlined,
            title: 'Institute',
            value: 'Air University',
            color: Colors.orange,
          ),
          const _ProfileInfoCard(
            icon: Icons.info_outline_rounded,
            title: 'Application',
            value: 'Campus Hub - Version 1.0',
            color: AppTheme.primary,
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Learn • Grow • Achieve',
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _ProfileInfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            value,
            style: const TextStyle(
              color: AppTheme.navy,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
