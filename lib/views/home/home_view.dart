import 'package:flutter/material.dart';
import 'package:my_books/utils/app_routes.dart';
import 'package:my_books/views/auth/login_view.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

/// Home Screen View
/// Displays after successful login
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBooks'),
        actions: [
          Consumer<AuthController>(
            builder: (context, authController, child) {
              return IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await authController.logout();
                  if (context.mounted) {
                    AppRoutes.navigateTo(context, const LoginView());
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book_outlined,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return Text(
                    'Welcome, ${authController.user?.name ?? authController.user?.email ?? 'User'}!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Books list coming soon...',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
