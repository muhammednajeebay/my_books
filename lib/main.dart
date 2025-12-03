import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'views/auth/login_view.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

/// Main Application Widget
/// Sets up Provider, and authentication state management
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthController(),
      child: Consumer<AuthController>(
        builder: (context, authController, child) {
          return MaterialApp(
            title: 'MyBooks',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.light,
              ),
              useMaterial3: true,
            ),
            builder: (context, child) {
              return (authController.isAuthenticated)
                  ? const HomeView()
                  : const LoginView();
            },
          );
        },
      ),
    );
  }
}
