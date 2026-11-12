import 'package:flutter/material.dart';

import '../../../core/app_routes.dart';
import '../../../core/app_theme.dart';

class CampusHubDrawer extends StatelessWidget {
  final String selectedRoute;

  const CampusHubDrawer({
    super.key,
    required this.selectedRoute,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: _destinations.indexWhere(
        (destination) => destination.route == selectedRoute,
      ),
      onDestinationSelected: (index) {
        final route = _destinations[index].route;
        if (route != selectedRoute) {
          Navigator.pushReplacementNamed(context, route);
        } else {
          Navigator.pop(context);
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFE5F4F4),
                child: Icon(Icons.school_rounded, color: AppTheme.primary),
              ),
              const SizedBox(height: 14),
              Text(
                'Campus Hub',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.navy,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Your student workspace',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        for (final destination in _destinations)
          NavigationDrawerDestination(
            icon: Icon(destination.icon),
            label: Text(destination.label),
          ),
      ],
    );
  }
}

class _Destination {
  final String route;
  final String label;
  final IconData icon;

  const _Destination(this.route, this.label, this.icon);
}

const _destinations = [
  _Destination(AppRoutes.home, 'Home', Icons.home_outlined),
  _Destination(AppRoutes.explore, 'Explore', Icons.explore_outlined),
  _Destination(AppRoutes.profile, 'Profile', Icons.person_outline_rounded),
  _Destination(AppRoutes.showcase, 'UI Showcase', Icons.widgets_outlined),
];
