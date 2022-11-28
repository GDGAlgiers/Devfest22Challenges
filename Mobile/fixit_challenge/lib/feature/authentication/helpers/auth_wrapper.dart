import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repository/authentication/authentication_repository.dart';
import '../../error/view/error_screen.dart';
import '../../home/views/home_screen.dart';
import '../../startup/views/welcome_screen.dart';

class AuthenticationWrapper extends ConsumerWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final asyncUser = ref.watch(authStateChangesProvider);

    return asyncUser.when(
      data: (user) => user != null ? HomeScreen() : WelcomeScreen(),
      loading: () => WelcomeScreen(),
      error: (e, stackTrace) => ErrorScreen(),
    );
  }
}
