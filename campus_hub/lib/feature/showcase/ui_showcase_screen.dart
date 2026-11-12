import 'package:flutter/material.dart';

import '../../core/app_routes.dart';
import '../../core/app_theme.dart';
import '../core/presentation/campus_hub_drawer.dart';
import 'web_page_panel.dart';

class UiShowcaseScreen extends StatelessWidget {
  const UiShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(title: const Text('UI Showcase')),
      drawer: const CampusHubDrawer(selectedRoute: AppRoutes.showcase),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Flutter Widget Gallery',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text('Common widgets and layout patterns'),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2F7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.widgets_rounded, size: 32, color: AppTheme.primary),
                SizedBox(width: 12),
                Expanded(child: Text('Container, Icon and Expanded')),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Buttons and Card',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilledButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Button pressed')),
                          );
                        },
                        child: const Text('Filled Button'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Outlined button pressed'),
                            ),
                          );
                        },
                        child: const Text('Outlined Button'),
                      ),
                      IconButton(
                        tooltip: 'Favorite',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to favorites'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                alignment: Alignment.center,
                color: Colors.black12,
                child: const Text('Image could not be loaded'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 130,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const Positioned(
                  left: 16,
                  top: 16,
                  child: Icon(
                    Icons.school_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
                const Positioned(
                  left: 16,
                  bottom: 16,
                  child: Text(
                    'Stack: widgets can overlap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Positioned(
                  right: 16,
                  top: 16,
                  child: Icon(Icons.star, color: Colors.amber, size: 28),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: width >= 600 ? 4 : 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
            children: const [
              _GridTile(icon: Icons.book_rounded, label: 'Courses'),
              _GridTile(icon: Icons.event_rounded, label: 'Events'),
              _GridTile(icon: Icons.task_alt_rounded, label: 'Tasks'),
              _GridTile(icon: Icons.person_rounded, label: 'Profile'),
            ],
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              const first = _InfoCard(
                title: 'Row / Column',
                text: 'Arrange children horizontally or vertically.',
              );
              const second = _InfoCard(
                title: 'Flexible',
                text:
                    'Share available space without forcing a child to fill it.',
                showFlexibleExample: true,
              );
              if (constraints.maxWidth < 500) {
                return const Column(
                  children: [
                    first,
                    second,
                  ],
                );
              }
              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: first),
                  SizedBox(width: 12),
                  Expanded(child: second),
                ],
              );
            },
          ),
          const SizedBox(height: 12),
          const Text(
            'Embedded web page',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const WebPagePanel(),
        ],
      ),
    );
  }
}

class _GridTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _GridTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: AppTheme.primary),
          const SizedBox(height: 6),
          Text(label),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String text;
  final bool showFlexibleExample;

  const _InfoCard({
    required this.title,
    required this.text,
    this.showFlexibleExample = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(text),
            if (showFlexibleExample) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F4F4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: AppTheme.primary),
                    SizedBox(width: 8),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text('Flexible text wraps in available space.'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
