import 'dart:convert';
import 'dart:html';

import 'package:mvvm_with_provider_example_1/models/post.dart';
import 'package:mvvm_with_provider_example_1/notifiers/posts_notifier.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String API_ENDPOINT =
      "https://jsonplaceholder.typicode.com/posts";

  static getPosts(PostsNotifier postsNotifier) async {
    List<Post> postList = [];
    http.get(Uri(query: API_ENDPOINT)).then((response) {
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      }

      List posts = jsonDecode(response.body);
      posts.forEach((element) {
        postList.add(Post.fromMap(element));
      });

      postsNotifier.setPostList(postList);
    });
  }

  static Future<bool> addPost(Post post, PostsNotifier postsNotifier) async {
    bool result = false;
    await http
        .post(Uri(query: API_ENDPOINT),
            headers: {"Content-type": "application/json; charset=UTF-8"},
            body: json.encode(post.toMap()))
        .then((response) {
      if (response.statusCode == 201) {
        result = true;
        postsNotifier.addPostToList(post);
      }
    });

    return result;
  }
}
