import 'package:flutter/material.dart';
import '../data/in_memory_task_repository.dart';
import '../domain/task.dart';
import 'add_task_screen.dart';
import 'task_detail_screen.dart';
import '../../../core/app_routes.dart';
import '../../../core/app_theme.dart';
import '../../core/presentation/campus_hub_drawer.dart';
import 'animated_welcome_card.dart';

class HomeScreen extends StatefulWidget {
  final InMemoryTaskRepository repository;

  const HomeScreen({super.key, required this.repository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Hub'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton.filledTonal(
              tooltip: 'Add task',
              onPressed: _addTask,
              icon: const Icon(Icons.add_rounded),
            ),
          ),
        ],
      ),
      drawer: const CampusHubDrawer(selectedRoute: AppRoutes.home),
      body: SafeArea(child: _buildHomeContent()),
    );
  }

  Widget _buildHomeContent() {
    final tasks = widget.repository.getTasks();

    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const AnimatedWelcomeCard(),
        const SizedBox(height: 26),
        const Text(
          'Your Overview',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppTheme.navy,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'My Tasks',
                value: '${tasks.length}',
                icon: Icons.checklist_rounded,
                color: AppTheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: _StatCard(
                title: 'Courses',
                value: '3',
                icon: Icons.menu_book_rounded,
                color: Color(0xFF8B5CF6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My Tasks',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppTheme.navy,
              ),
            ),
            TextButton(
              onPressed: _addTask,
              child: const Text('＋ Add New'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (tasks.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text('No tasks yet. Add your first task!'),
              ),
            ),
          ),
        ...tasks.map(
          (task) => Card(
            elevation: 1,
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F4F4),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.task_alt_rounded,
                  color: AppTheme.primary,
                ),
              ),
              title: Text(
                task.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.navy,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  task.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              ),
              onTap: () => _openTask(task),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 54,
          child: FilledButton.icon(
            onPressed: _addTask,
            icon: const Icon(Icons.add_circle_outline),
            label: const Text(
              'Create New Task',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _openTask(Task task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TaskDetailScreen(task: task),
      ),
    ).then((_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> _addTask() async {
    final task = await Navigator.push<Task>(
      context,
      MaterialPageRoute(
        builder: (_) => const AddTaskScreen(),
      ),
    );

    if (task != null && mounted) {
      setState(() {
        widget.repository.addTask(task);
      });
    }
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 25),
          ),
          const SizedBox(height: 18),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.navy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
