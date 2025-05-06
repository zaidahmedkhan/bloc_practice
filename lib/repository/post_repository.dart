import 'dart:convert';
import 'dart:io';
import 'package:bloc_practice/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/comments"),
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e['postId'] as int,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      } else {
        throw Exception("failed to load data");
      }
    } on SocketException {
      throw Exception("error while fetching data");
    }
  }
}
