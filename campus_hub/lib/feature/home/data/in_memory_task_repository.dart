import '../domain/task.dart';
import '../domain/task_repository.dart';

class InMemoryTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(
      id: '1',
      title: 'Complete Flutter Lab',
      description: 'Build and improve the Campus Hub application.',
    ),
    const Task(
      id: '2',
      title: 'Prepare Project Idea',
      description: 'Write a proposal for the semester project.',
    ),
  ];

  @override
  List<Task> getTasks() => List.unmodifiable(_tasks);

  @override
  void addTask(Task task) {
    _tasks.add(task);
  }
}
