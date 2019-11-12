import 'dart:async';
import 'dart:convert';

import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/core/services/base_service/api_repository.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';


class AuthenticationService  extends ApiRepository{

  StreamController<User> userController = StreamController<User>();

  Stream<User> get user => userController.stream;

  Future<bool> login(IBaseView model,int userId) async {
    final fetchedUser = await getRequest(model, '/users/$userId');
    User user=User.fromJson(json.decode(fetchedUser));
    var hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(user);
    }
    return hasUser;
  }
}
