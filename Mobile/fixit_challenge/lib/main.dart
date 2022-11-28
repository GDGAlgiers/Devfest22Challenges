import 'package:firebase_core/firebase_core.dart';
import 'package:fixit/core/riverpod_logger.dart';
import 'package:fixit/feature/error/view/error_screen.dart';
import 'package:fixit/utils/navigation.dart';
import 'package:fixit/utils/theme.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nb_utils/nb_utils.dart';

import 'feature/startup/views/splash_screen.dart';

Future<void> main() async {
  m.WidgetsFlutterBinding.ensureInitialized();

  /// Initializing shared preference via nb_utils package
  await initialize();

  /// Initialize firebase
  await Firebase.initializeApp();

  /// A widget that stores the state of providers.
  /// All Flutter applications using Riverpod must contain a [ProviderScope] at
  /// the root of their widget tree
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends m.StatelessWidget {
  @override
  m.Widget build(m.BuildContext context) {
    /// Hide Keyboard
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return m.MaterialApp(
      title: 'Listify',
      navigatorKey: Navigation.key,
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: SplashScreen(),
    );
  }
}
