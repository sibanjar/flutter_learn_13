

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_13/utility/routes/app_routes.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart';
import 'object_box/store.dart';

FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

late ObjectBox objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZones();

  AndroidInitializationSettings androidSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
  DarwinInitializationSettings  iosSettings = const DarwinInitializationSettings();

  InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings
  );

  bool? initialized = await notificationsPlugin.initialize(initializationSettings);

  objectBox = await ObjectBox.create();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  AppRouter router =AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.returnRouter(false),
    );

  }
}

