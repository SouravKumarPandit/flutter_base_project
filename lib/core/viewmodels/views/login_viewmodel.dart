import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/models/alert_response.dart';
import 'package:flutter_base_project/core/services/authentication_service.dart';
import 'package:flutter_base_project/core/services/dialog_service.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';
import 'package:flutter_base_project/locator.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel implements ILoginView {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  BehaviorSubject<bool> isValidUser;

  LoginViewModel() {
    isValidUser = new BehaviorSubject<bool>();
  }

  Future showCustomDialog(
      {Widget title = const Text("Title"),
      Widget message = const Text(""),
      List<Widget> actions}) async {
    var dialogResult = await _dialogService.showCustomDialog(
        title: title, content: message, actions: actions);

    if (dialogResult.confirmed) {

    } else {

    }
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

  void closeDialog() {
    _dialogService.customDialogComplete(AlertWidgetResponse(confirmed: true));
  }
}
