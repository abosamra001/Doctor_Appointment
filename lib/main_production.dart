import 'package:advanced2/core/di/dependency_injection.dart';
import 'package:advanced2/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:advanced2/docdoc_app.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
      systemNavigationBarColor: Colors.green,
    ),
  );

  runApp(DocDocApp(appRouter: AppRouter()));
}
