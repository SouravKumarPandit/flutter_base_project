import 'package:flutter_base_project/core/services/authentication_service.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/locator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<bool> login(String userIdText) async {
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(this, userId);
    return success;
  }
}
