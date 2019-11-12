import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CLMessageUtil {
  static const int WARNING = 0;
  static const int ERROR = 1;
  static const int INFO = 2;
  static const int SUCCESS = 3;

  /*
    * Alert Dialog Messages
    *
    * */

  static void showMsg(BuildContext context, String sTitle, String sMessage,
      {bool isCloseAppOnClickOk, bool isCancelable, int messageType}) async {
    Color clColor = Colors.black;

    if (messageType == WARNING)
      clColor = Colors.amberAccent;
    else if (messageType == ERROR)
      clColor = Colors.red;
    else if (messageType == INFO)
      clColor = Colors.indigo;
    else if (messageType == SUCCESS) clColor = Colors.green;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            sTitle,
            style: TextStyle(color: clColor),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  sMessage,
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'ok',
                style: TextStyle(color: clColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showSnackBar(BuildContext clContext, String sMessage,
      {Duration duration, int messageType, Color textColor}) // todo not tested
  {
    Color clColor = Colors.black;

    if (messageType == WARNING)
      clColor = Colors.amberAccent;
    else if (messageType == ERROR)
      clColor = Colors.red;
    else if (messageType == INFO)
      clColor = Colors.indigo;
    else if (messageType == SUCCESS) clColor = Colors.green;
    duration = duration ?? new Duration(milliseconds: 250);

    final snackBar = SnackBar(
      content: Text(sMessage),
      backgroundColor: clColor,
      duration: duration,
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change!
          Navigator.pop(clContext);
        },
      ),
    );

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(clContext).showSnackBar(snackBar);
  }

  /*
    * Toast Messages
    *
    * */

  static void showToast(BuildContext context, String sMessage,
      {Color clTextColor, Color clBackgroundColor}) {
    Flushbar(
      message: sMessage,
      backgroundColor: clBackgroundColor,
    ).show(context);
  }
}
