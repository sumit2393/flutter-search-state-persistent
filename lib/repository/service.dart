import 'dart:convert';

import 'package:dummy/postmodel.dart';
import 'package:http/http.dart' as http;

class ServiceRepository {
  Future<List<PostModel>> fetchsearchdata(String query) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      return data
          .where(
            (e) => e['title'].toString().toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .map<PostModel>((e) => PostModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
