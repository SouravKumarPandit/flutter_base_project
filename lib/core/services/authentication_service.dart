import 'dart:async';

import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/locator.dart';

import 'api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if(hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}