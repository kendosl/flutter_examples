import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_1/notifiers/posts_notifier.dart';
import 'package:mvvm_with_provider_example_1/service/api.dart';
import 'package:mvvm_with_provider_example_1/views/post_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PostsNotifier postsNotifier =
        Provider.of<PostsNotifier>(context, listen: false);
    ApiService.getPosts(postsNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PostsNotifier postsNotifier = Provider.of<PostsNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM + Provider Demo"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/add_post");
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: postsNotifier != null
          ? Container(
              color: Colors.black12,
              child: ListView.builder(
                itemCount: postsNotifier.getPostList().length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    key: ObjectKey(postsNotifier.getPostList()[index]),
                    child: PostView(
                      post: postsNotifier.getPostList()[index],
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
