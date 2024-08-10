import 'package:flutter/material.dart';
import 'package:flutter_http/models/post_model.dart';
import 'package:flutter_http/repoistory/posts_repostiory.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  String _error = '';
  bool _isLoading = false;

  List<Post> get posts => _posts;
  String get error => _error;
  bool get isLoading => _isLoading;

  final PostsRepository postsRepository = PostsRepository();

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    var callResult = await postsRepository.get();
    if (callResult.isSuscces) {
      _posts = List<Post>.from(
          callResult.data.map((e) => Post.fromJson(e)).toList());
      _error = '';
    } else {
      _error = callResult.error;
    }
    _isLoading = false;
    notifyListeners();
  }
}
