import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/models/alert_request.dart';
import 'package:flutter_base_project/core/models/alert_response.dart';
import 'package:flutter_base_project/core/services/dialog_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService;

  @override
  void initState() {
    super.initState();
    _dialogService = new DialogService();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    Alert(
        context: context,
        title: request.title,
        desc: request.description,
        closeFunction: () =>
            _dialogService.dialogComplete(AlertResponse(confirmed: false)),
        buttons: [
          DialogButton(
            child: Text(request.buttonTitle),
            onPressed: () {
              _dialogService.dialogComplete(AlertResponse(confirmed: true));
              Navigator.of(context).pop();
            },
          )
        ]).show();
  }
}
