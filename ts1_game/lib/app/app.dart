import 'package:flutter/material.dart';
import 'router.dart';
import 'theme/app_theme.dart';

class TheSpecialOneApp extends StatelessWidget {
  const TheSpecialOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'The Special One',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
