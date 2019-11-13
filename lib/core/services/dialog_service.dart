import 'dart:async';
import 'package:flutter_base_project/core/models/alert_request.dart';
import 'package:flutter_base_project/core/models/alert_response.dart';

class DialogService {
  Function(AlertRequest) _showDialogListener;
  Completer<AlertResponse> _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
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

  void dialogComplete(AlertResponse response) {

    if(_dialogCompleter.isCompleted){
      return ;
    }
    if (response != null) _dialogCompleter.complete(response);
  }
}
