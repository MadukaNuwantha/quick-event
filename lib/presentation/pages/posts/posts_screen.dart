import 'package:app/presentation/widgets/common/custom_appbar.dart';
import 'package:app/presentation/widgets/posts/post_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Posts',
        leftIcon: Icons.arrow_back,
        onTapLeft: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('/view-post');
                },
                child: PostListTile(),
              );
            },
          ),
        ),
      ),
    );
  }
}
