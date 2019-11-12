import 'dart:convert';

import 'package:flutter_base_project/core/models/comment.dart';
import 'package:flutter_base_project/core/models/post.dart';
import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/core/services/base_service/api_repository.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';

/// The service responsible for networking requests
class LoginService extends ApiRepository {
  Future<User> getUserProfile(IBaseView model, int userId) async {
    // Get user profile for id
    final response = await getRequest(model, '/users/$userId');
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(IBaseView model, int userId) async {
    var posts = List<Post>();

    // Get user posts for id
    // parse into List
    try {
      final response = await getRequest(model, '/posts?userId=$userId');
      var parsed = json.decode(response) as List<dynamic>;
      for (var post in parsed) {
        posts.add(Post.fromJson(post));
      }
    } catch (e) {
      model.showError(0, "Internet failes");
    }

    // loop and convert each item to Post

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(IBaseView model, int postId) async {
    var comments = List<Comment>();

    // Get comments for post
    final response = await getRequest(model, '/comments?postId=$postId');
    // Parse into List
    var parsed = json.decode(response) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
