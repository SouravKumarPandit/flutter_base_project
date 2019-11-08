import 'package:flutter/material.dart' show required;
import 'package:flutter_base_project/core/models/post.dart';
import 'package:flutter_base_project/core/services/api.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';

class PostsModel extends BaseViewModel {
  Api _api;

  PostsModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
