import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'features/app/ui/app.dart';

void main() {
  final uncaughtExceptionsController = StreamController<void>.broadcast();

  PlatformDispatcher.instance.onError = (error, stackTrace) {
    log(
      'Uncaught exception:',
      error: error,
      stackTrace: stackTrace,
    );

    uncaughtExceptionsController.addError(error, stackTrace);

    return true;
  };

  FlutterError.onError = (details) {
    log(
      'Uncaught exception:',
      error: details.exception,
      stackTrace: details.stack,
    );

    if (!details.silent) {
      uncaughtExceptionsController.addError(details.exception, details.stack);
    }
  };

  runApp(App(uncaughtException: uncaughtExceptionsController.stream));
}
