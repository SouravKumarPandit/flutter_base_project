import 'package:flutter/material.dart';

import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';

class BaseViewModel extends ChangeNotifier implements IBaseView{
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void onResponseError(String message) {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void handleResponse(Object responseObject) {
  }

  @override
  void hideProgressbar() {
    setBusy(false);
  }

  @override
  void showError(int iStatusCode, String sMessage) {

  }

  @override
  void showProgressbar() {
    setBusy(true);
  }
}
