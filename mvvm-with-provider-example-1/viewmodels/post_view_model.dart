import 'package:mvvm_with_provider_example_1/models/post.dart';

class PostViewModel {
  late Post _post;

  setPost(Post post) {
    _post = post;
  }

  Post get post => _post;
}
