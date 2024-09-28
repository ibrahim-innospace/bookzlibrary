import 'book.dart';

class Category {
  final String id;
  final String name;
  final List<Book> books;

  Category({required this.id, required this.name, required this.books});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      books: (json['books'] as List)
          .map((bookJson) => Book.fromJson(bookJson))
          .toList(),
    );
  }
}
