import 'package:bloc_practice/bloc/posts/post_bloc.dart';
import 'package:bloc_practice/bloc/posts/post_events.dart';
import 'package:bloc_practice/bloc/posts/post_states.dart';
import 'package:bloc_practice/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Apis")),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return CircularProgressIndicator();
            case PostStatus.failure:
              return Text(state.message.toString());
            case PostStatus.success:
              return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  final item = state.postList[index];
                  return ListTile(
                    title: Text(item.email.toString()),
                    subtitle: Text(item.body.toString()),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
