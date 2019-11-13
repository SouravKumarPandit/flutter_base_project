import 'dart:async';
import 'dart:convert';

import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/core/services/base_service/api_repository.dart';
import 'package:flutter_base_project/managers/session_manager.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';
import 'package:flutter_base_project/locator.dart';


class AuthenticationService{
  ApiRepository apiRepository=locator<ApiRepository>();

  Future<bool> login(IBaseView model,String userId) async {
    final fetchedUser = await apiRepository.getRequest(model, '/users/$userId');
    User user=User.fromJson(json.decode(fetchedUser));
    var hasUser = fetchedUser != null;
    if (hasUser) {
      locator<SessionManager>().userController.add(user);
    }
    return hasUser;
  }
}
