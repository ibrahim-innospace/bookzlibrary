import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_links/app_links.dart';

import '../features/home/presentation/home_page.dart';
import '../features/categories/presentation/categories_page.dart';
import '../features/books/presentation/books_page.dart';
import '../features/books/presentation/book_details_page.dart';

class AppRouter {
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoriesPage(),
      ),
      GoRoute(
        path: '/categories/:categoryId',
        builder: (context, state) {
          final categoryId = state.pathParameters['categoryId']!;
          return BooksPage(categoryId: categoryId);
        },
      ),
      GoRoute(
        path: '/categories/:categoryId/:bookId',
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          final categoryId = state.pathParameters['categoryId']!;
          return BookDetailsPage(
            bookId: bookId,
            categoryId: categoryId,
          );
        },
      ),
    ],
  );

  static GoRouter get router => _router;

  static Future<void> setupDeepLinks() async {
    final appLinks = AppLinks();

    // Handle deep links
    appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null && uri.path.isNotEmpty) {
        _router.push(uri.path);
      } else {
        print('Invalid or null URI received');
      }
    });

    // Handle deferred deep links
    final initialUri = await appLinks.getInitialAppLink();
    if (initialUri != null && initialUri.path.isNotEmpty) {
      _router.push(initialUri.path);
    } else {
      print('No initial URI found or it is null');
    }
  }
}
