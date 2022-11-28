import 'dart:io';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object previousValue,
    Object newValue,
    ProviderContainer container,
  ) {
    Log.info('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

runApp(widget) {
  var rng = Random();
  int rang = rng.nextInt(4);

  switch (rang) {
    case 0:
      {
        throw FormatException("let the fun begin");
      }
      break;

    case 2:
      {
        throw FileSystemException(
            "the system can't load thes images from the project folder"
            "read more : https://stackoverflow.com/"
            "questions/13579982/how-to-create-a-custom-exception-and-handle-it-in-dart");
      }

    case 3:
      {
        throw throw HttpException("can not connect to firebase");
      }

    case 4:
      {
        throw HttpException("incompatible version of flutter");
      }
  }
}
