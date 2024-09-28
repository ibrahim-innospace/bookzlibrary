import 'package:flutter/material.dart';
import 'routing/app_router.dart';

class BookLibraryApp extends StatelessWidget {
  const BookLibraryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Book Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
