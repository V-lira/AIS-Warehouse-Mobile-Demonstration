import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';

class WarehouseApp extends StatelessWidget {
  const WarehouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIS Warehouse Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // Начинаем с экрана входа
    );
  }
}