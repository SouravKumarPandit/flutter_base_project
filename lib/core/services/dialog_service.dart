import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_project/core/models/alert_request.dart';
import 'package:flutter_base_project/core/models/alert_response.dart';

class DialogService {
  Function(AlertRequest) _showDialogListener;
  Completer<AlertResponse> _dialogCompleter;
  Completer<AlertWidgetResponse> _customDialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AlertWidgetResponse> showCustomDialog(
      {Widget title, Widget content, List<Widget> actions}) {
    _customDialogCompleter = Completer<AlertWidgetResponse>();
    _showDialogListener(
      AlertWidgetRequest(
        titleWidget: title,
        contentWidget: content,
        buttonTitleWidget: actions,
      ),
    );
    return _customDialogCompleter.future;
  }

  Future<AlertResponse> showDialog(
      {String title, String description, String buttonTitle = 'OK'}) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(
      AlertRequest(
        title: title,
        description: description,
        buttonTitle: buttonTitle,
      ),
    );
    return _dialogCompleter.future;
  }

  void customDialogComplete(AlertWidgetResponse response) {
    if (_customDialogCompleter.isCompleted) {
      return;
    }

    if (response != null) _customDialogCompleter.complete(response);
  }

  void dialogComplete(AlertResponse response) {
    if (_dialogCompleter.isCompleted) {
      return;
    }
    if (response != null) _dialogCompleter.complete(response);
  }

  void closeDialogListener(context) {
    Navigator.of(context).pop();
  }
}
