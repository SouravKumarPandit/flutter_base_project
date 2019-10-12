import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/core/models/post.dart';
import 'package:flutter_base_project/ui/views/home_view.dart';
import 'package:flutter_base_project/ui/views/login_view.dart';
import 'package:flutter_base_project/ui/views/post_view.dart';

const String initialRoute = "login";

class BaseRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/practice':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/post':
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
