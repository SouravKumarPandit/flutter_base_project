import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/services/dialog_service.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';
import 'package:flutter_base_project/locator.dart';

class BaseViewModel extends ChangeNotifier implements IBaseView {
  final DialogService _dialogService = locator<DialogService>();
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
    this.dispose();
  }

  @override
  void handleResponse(Object responseObject) {}

  @override
  void hideProgressbar() {
    setBusy(false);
  }

  @override
  void showError(int iStatusCode, String sMessage) {
    setBusy(false);
    if (iStatusCode < -1) {
      showCustomErrorMessage(message: sMessage);
    } else
      showInternetFailed();
  }

  @override
  void showProgressbar() {
    setBusy(true);
  }

  Future showCustomErrorMessage({String title='Ohh No!',String message=''}) async {
    var dialogResult =
        await _dialogService.showDialog(title: title, description: message);

    if (dialogResult.confirmed) {
    } else {}
  }

  Future showInternetFailed() async {
    var dialogResult = await _dialogService.showDialog(
        title: 'Connection Error',
        description:
            'An error has occurred, please check your connection and try agian later .');

    if (dialogResult.confirmed) {
    } else {}
  }

  @override
  void invalidate() {
   notifyListeners();
  }
}
