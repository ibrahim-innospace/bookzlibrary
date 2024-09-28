import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Library')),
      body: Center(
        child: ElevatedButton(
          child: const Text('View Categories'),
          onPressed: () => context.go('/categories'),
        ),
      ),
    );
  }
}
