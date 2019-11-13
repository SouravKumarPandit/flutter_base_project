import 'package:flutter_base_project/core/services/authentication_service.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';
import 'package:flutter_base_project/locator.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel implements ILoginView {
  final AuthenticationService _authService = locator<AuthenticationService>();
  BehaviorSubject<bool> isValidUser;

  LoginViewModel() {
    isValidUser = new BehaviorSubject<bool>();
  }

  @override
  void authenticateUser(String userId) async {
    if (userId.isEmpty) return;
    bool isUserValid = await _authService.login(this, userId);
    if (!isValidUser.isClosed) {
      if (isUserValid && userId != "1") {
        isValidUser.add(isUserValid);
        isValidUser.close();
      } else
        isValidUser.addError("Invalid user");
    }
  }

  @override
  void dispose() {
    super.dispose();
    isValidUser.close();
  }
}
