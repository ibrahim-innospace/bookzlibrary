import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/models/category.dart';
import '../../../services/api_service.dart';

class BooksPage extends StatefulWidget {
  final String categoryId;

  const BooksPage({Key? key, required this.categoryId}) : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final ApiService _apiService = ApiService();
  late Future<Category> _categoryFuture;

  @override
  void initState() {
    super.initState();
    _categoryFuture = _apiService.getCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Books in ${widget.categoryId}')),
      body: FutureBuilder<Category>(
        future: _categoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final category = snapshot.data!;
            return ListView.builder(
              itemCount: category.books.length,
              itemBuilder: (context, index) {
                final book = category.books[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  onTap: () =>
                      context.go('/categories/${widget.categoryId}/${book.id}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No books found'));
          }
        },
      ),
    );
  }
}
