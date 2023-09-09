import 'package:flutter/material.dart';
import 'package:printer3d_cam/config/router/app_router.dart';
import 'package:printer3d_cam/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Printer 3D Cam',
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}
