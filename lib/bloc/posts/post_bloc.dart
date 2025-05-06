import 'package:bloc_practice/bloc/posts/post_events.dart';
import 'package:bloc_practice/bloc/posts/post_states.dart';
import 'package:bloc_practice/repository/post_repository.dart';
import 'package:bloc_practice/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  PostRepository postRepository = PostRepository();

  PostBloc() : super(PostStates()) {
    on<PostFetched>(fetchPostApi);
  }

  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository
        .fetchPost()
        .then((value) {
          emit(
            state.copyWith(
              postStatus: PostStatus.success,
              message: "success",
              postList: value,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              postStatus: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }
}
