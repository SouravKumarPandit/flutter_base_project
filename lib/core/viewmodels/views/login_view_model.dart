import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/core/services/authentication_service.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
