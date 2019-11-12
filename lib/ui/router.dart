import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/core/models/post.dart';
import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/ui/views/home_view.dart';
import 'package:flutter_base_project/ui/views/login_view.dart';
import 'package:flutter_base_project/ui/views/photo_view.dart';
import 'package:flutter_base_project/ui/views/post_view.dart';

const String initialRoute = "login";

class AppRouter {
  static const String HOME = '/';
  static const String LOGIN = '/login';
  static const String POST = '/post';
  static const String PHOTO="/photo";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PHOTO:
        User arguments = settings.arguments as User;
        return MaterialPageRoute(builder: (_) => PhotoView(arguments ));
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeView());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginView());
      case POST:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
