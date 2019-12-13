import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/models/alert_request.dart';
import 'package:flutter_base_project/core/models/alert_response.dart';
import 'package:flutter_base_project/core/services/dialog_service.dart';
import 'package:flutter_base_project/locator.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showMaterialDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showMaterialDialog(AlertRequest request) {
    if (request is AlertWidgetRequest) {
      showDialog(
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            title: Stack(
              children: <Widget>[
                request.titleWidget,
                Positioned(
                    right: 0,
                    top: 0,
                    child: InkWell(
                      child: Icon(Icons.clear),
                      onTap: onDialogClose,
                    ))
              ],
            ),
            content: request.contentWidget,
            actions: request.buttonTitleWidget,
          );
        },
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Text(request.title),
              content: Text(request.description),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    _dialogService
                        .dialogComplete(AlertResponse(confirmed: true));
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                )
              ],
            );
          });
    }
  }

  void onDialogClose() {
    _dialogService.customDialogComplete(AlertWidgetResponse(confirmed: false));
    Navigator.of(context).pop();
  }
}
