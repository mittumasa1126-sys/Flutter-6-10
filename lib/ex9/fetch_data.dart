import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(id: json['id'], title: json['title'], body: json['body']);
}

Future<List<Post>> fetchPosts(int limit) async {
  final uri = Uri.https('jsonplaceholder.typicode.com', '/posts', {'_limit': '$limit'});
  final resp = await http.get(uri).timeout(const Duration(seconds: 10));
  if (resp.statusCode == 200) {
    final List<dynamic> data = jsonDecode(resp.body);
    return data.map((e) => Post.fromJson(e)).toList();
  } else {
    throw Exception('Server error: ${resp.statusCode}');
  }
}
