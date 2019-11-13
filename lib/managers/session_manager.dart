import 'dart:async';

import 'package:flutter_base_project/core/models/user.dart';

class SessionManager {
  StreamController<User> userController = StreamController<User>();

  Stream<User> get user => userController.stream;

  logoutSession(){
    userController.close();
  }

}