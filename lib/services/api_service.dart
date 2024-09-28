import 'dart:convert';
import 'package:http/http.dart' as http;
import '../features/common/models/category.dart';
import '../features/common/models/book.dart';

class ApiService {
  final String baseUrl =
      'http://10.0.2.2:3000'; // Use this for Android emulator
  // final String baseUrl = 'http://localhost:3000'; // Use this for iOS simulator

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/api/categories'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<Category> getCategory(String categoryId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/categories/$categoryId'));
    if (response.statusCode == 200) {
      return Category.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load category');
    }
  }

  Future<Book> getBook(String categoryId, String bookId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/api/categories/$categoryId/$bookId'));
    if (response.statusCode == 200) {
      return Book.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load book');
    }
  }
}
