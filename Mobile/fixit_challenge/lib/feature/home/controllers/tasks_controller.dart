import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../core/dependency/repository.dart';
import '../../../data/model/todo.dart';
import '../../../data/repository/task/task_repository.dart';

final tasksProvider = Provider((ref) => _TasksController(ref: ref));

final taskProvider = Provider<Todo>((ref) => throw UnimplementedError());

final pendingTasksProvider = StreamProvider<List<Todo>>((ref) {
  return ref.watch(Repository.task).pendingTasks();
});

final completedTasksProvider = StreamProvider<List<Todo>>((ref) {
  return ref.watch(Repository.task).completedTasks();
});

class _TasksController {
  _TasksController({this.ref}) {
    _repository = ref.watch(Repository.task);
  }

  final Ref ref;
  TaskRepository _repository;

  void completeTask(uid) {
    _repository.completeTask(uid);
  }

  void undoCompleteTask(uid) {
    _repository.undoCompleteTask(uid);
  }

  void removeTodo(uid) {
    _repository.removeTodo(uid);
  }
}
