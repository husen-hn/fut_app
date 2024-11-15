//
//  bootstrap.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github,
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:fut_app/apps/app/app_repository.dart';
import 'package:fut_app/apps/observer.dart';
import 'package:fut_app/templates/app/app.dart';

Future<void> bootstrap() async {
  ///
  /// print all state change errors about [Bloc] library in console.
  ///
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  ///
  /// observes all state changes about [Bloc] library.
  ///
  Bloc.observer = const Observer();

  final AppRepository appRepository = AppRepository();

  runApp(App(appRepository: appRepository));
}
