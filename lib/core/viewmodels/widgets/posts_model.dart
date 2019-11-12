import 'package:flutter_base_project/core/models/post.dart';
import 'package:flutter_base_project/core/services/login_services.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/locator.dart';

class PostsViewModel extends BaseViewModel {
  LoginService _api = locator<LoginService>();

  List<Post> posts;

  Future getPosts(int userId) async {
    posts = await _api.getPostsForUser(this, userId);
  }
}
