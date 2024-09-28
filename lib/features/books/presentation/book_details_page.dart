import 'package:flutter/material.dart';
import '../../common/models/book.dart';
import '../../../services/api_service.dart';

class BookDetailsPage extends StatefulWidget {
  final String categoryId;
  final String bookId;

  const BookDetailsPage(
      {Key? key, required this.categoryId, required this.bookId})
      : super(key: key);

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  final ApiService _apiService = ApiService();
  late Future<Book> _bookFuture;

  @override
  void initState() {
    super.initState();
    _bookFuture = _apiService.getBook(widget.categoryId, widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: FutureBuilder<Book>(
        future: _bookFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final book = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title: ${book.title}',
                      style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 8),
                  Text('Author: ${book.author}',
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 16),
                  Text('Book ID: ${book.id}'),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Book not found'));
          }
        },
      ),
    );
  }
}
