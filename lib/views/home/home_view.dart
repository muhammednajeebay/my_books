import 'package:flutter/material.dart';
import 'package:my_books/controllers/books_controller.dart';
import 'package:my_books/utils/app_routes.dart';
import 'package:my_books/views/auth/login_view.dart';
import 'package:my_books/views/books_details/book_details_view.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

/// Home Screen View
/// Displays after successful login
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BooksController(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<AuthController>(
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
          centerTitle: true,
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
        body: Consumer<BooksController>(
          builder: (context, controller, _) {
            if (controller.isInitialLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.errorMessage != null && controller.works.isEmpty) {
              return _ErrorState(
                message: controller.errorMessage!,
                onRetry: controller.init,
              );
            }

            if (controller.works.isEmpty) {
              return const _EmptyState();
            }

            return RefreshIndicator(
              onRefresh: controller.refresh,
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.extentAfter < 250 &&
                      controller.hasMore) {
                    controller.loadMore();
                  }
                  return false;
                },
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemBuilder: (context, index) {
                    if (index == controller.works.length) {
                      return _LoadingMoreRow(
                        isLoading: controller.isLoadingMore,
                      );
                    }

                    final work = controller.works[index];
                    final author = work.authors?.isNotEmpty == true
                        ? work.authors!.first.name
                        : 'Unknown author';

                    return InkWell(
                      onTap: () {
                        print("work: ${work.toJson()}");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookDetailsView(book: work),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: const Icon(Icons.menu_book_outlined),
                        title: Text(work.title ?? 'Untitled'),
                        subtitle: Text(
                          '$author • ${work.firstPublishYear ?? 'N/A'}',
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemCount:
                      controller.works.length +
                      (controller.hasMore || controller.isLoadingMore ? 1 : 0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LoadingMoreRow extends StatelessWidget {
  const _LoadingMoreRow({required this.isLoading});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('That’s all for now!', textAlign: TextAlign.center),
      );
    }

    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 8),
          Text('Loading more books...'),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No books found. Pull to refresh.'));
  }
}
