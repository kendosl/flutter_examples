import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_1/models/post.dart';
import 'package:mvvm_with_provider_example_1/viewmodels/post_view_model.dart';

class PostView extends StatefulWidget {
  final Post post;

  const PostView({required this.post});

  @override
  State<PostView> createState() => _PostViewState(post);
}

class _PostViewState extends State<PostView> {
  late Post post;
  late PostViewModel postViewModel;

  _PostViewState(this.post) {
    postViewModel = PostViewModel();
    postViewModel.setPost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        postViewModel.post.id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        postViewModel.post.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 0,
            child: Divider(
              height: 1,
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(postViewModel.post.body),
            ),
          ),
          const Expanded(
            flex: 0,
            child: Divider(
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
