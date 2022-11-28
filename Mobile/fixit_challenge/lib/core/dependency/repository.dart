import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/authentication/authentication_repository.dart';
import '../../data/repository/task/task_repository.dart';


abstract class Repository {
  static Provider<AuthenticationRepository> get authentication =>
      AuthenticationRepository.provider;

  static Provider<TaskRepository> get task => TaskRepository.provider;
}
