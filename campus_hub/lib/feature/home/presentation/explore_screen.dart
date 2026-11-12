import 'package:flutter/material.dart';

import '../../../core/app_routes.dart';
import '../../../core/app_theme.dart';
import '../../core/presentation/campus_hub_drawer.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore Campus')),
      drawer: const CampusHubDrawer(selectedRoute: AppRoutes.explore),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(
            'Explore Campus',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppTheme.navy,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Discover learning resources and campus activities.',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 24),
          const _ExploreCard(
            icon: Icons.event_rounded,
            title: 'Upcoming Events',
            subtitle: 'Workshops, seminars and student activities',
            color: Colors.orange,
          ),
          const _ExploreCard(
            icon: Icons.library_books_rounded,
            title: 'Learning Resources',
            subtitle: 'Study notes, guides and project ideas',
            color: Colors.purple,
          ),
          const _ExploreCard(
            icon: Icons.groups_rounded,
            title: 'Student Community',
            subtitle: 'Learn, share and grow together',
            color: AppTheme.primary,
          ),
        ],
      ),
    );
  }
}

class _ExploreCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _ExploreCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
