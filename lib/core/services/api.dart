import 'dart:convert';
import 'package:flutter_base_project/core/models/comment.dart';
import 'package:flutter_base_project/core/models/post.dart';
import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/core/services/base_service/api_helper.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api extends ApiBaseHelper {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await client.get('$endpoint/users/$userId');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();

    // Get user posts for id
    var response = await client.get('$endpoint/posts?userId=$userId');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    // Get comments for post
    var response = await client.get('$endpoint/comments?postId=$postId');

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
