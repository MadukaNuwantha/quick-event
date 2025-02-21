import 'package:app/presentation/bloc/event_bloc/event_bloc.dart';
import 'package:app/presentation/widgets/common/custom_appbar.dart';
import 'package:app/presentation/widgets/common/snack_bars.dart';
import 'package:app/presentation/widgets/posts/post_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventBloc>().add(LoadEventPosts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventBloc, EventState>(
      listener: (context, state) {
        if (state is EventError) {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(state.message),
          );
        }
      },
      builder: (context, state) {
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
              child: state is EventPostsLoaded && state.eventPosts.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.eventPosts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push('/view-post');
                          },
                          child: PostListTile(postEntity: state.eventPosts[index]),
                        );
                      },
                    )
                  : SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
