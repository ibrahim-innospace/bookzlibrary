import 'package:flutter/material.dart';
import 'app.dart';
import 'routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppRouter.setupDeepLinks();
  runApp(const BookLibraryApp());
}
