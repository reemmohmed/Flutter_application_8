import 'package:flutter/material.dart';
import 'package:flutter_http/models/comment_model.dart';
import 'package:flutter_http/repoistory/comments_repostiory.dart';

class CommentProvider with ChangeNotifier {
  List<Comment> _comments = [];
  String _error = '';
  bool _isLoading = false;

  List<Comment> get comments => _comments;
  String get error => _error;
  bool get isLoading => _isLoading;

  final CommentsRepository commentsRepository = CommentsRepository();

  Future<void> fetchComments(int postId) async {
    _isLoading = true;
    notifyListeners();

    var callResult = await commentsRepository.get({'postId': postId});
    if (callResult.isSuscces) {
      _comments = List<Comment>.from(
          callResult.data.map((e) => Comment.fromJson(e)).toList());
      _error = '';
    } else {
      _error = callResult.error;
    }
    _isLoading = false;
    notifyListeners();
  }
}
