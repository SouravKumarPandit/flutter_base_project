import 'package:flutter/material.dart';
import 'package:flutter_base_project/const_value.dart';
import 'package:flutter_base_project/core/enums/viewstate.dart';
import 'package:flutter_base_project/core/viewmodels/login_model.dart';
import 'package:flutter_base_project/ui/base/base_widget.dart';
import 'package:flutter_base_project/ui/shared/app_colors.dart';
import 'package:flutter_base_project/ui/utils/fonts/font_icons.dart';
import 'package:flutter_base_project/ui/widgets/login_header.dart';

import '../base/base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInfo) => BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginHeader(
                  validationMessage: model.errorMessage,
                  controller: _controller),
              Icon(
                FontIcons.thumbs_up_alt,
                size: 25,
                color: Colors.blueAccent,
              ),
              Image.asset(
                VConstants.RESOURCE_CONST.appLogo,
                height: 100,
                width: 100,
              ),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        VConstants.STRING_CONST.appName,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        final loginSuccess =
                            await model.login(_controller.text);
                        if (loginSuccess) {
                          await Navigator.pushNamed(context, '/');
                        }
                      },
                    ),
              MaterialButton(
                color: Theme.of(context).accentColor,
                onPressed: () {
                  model.doThings();
                },
                child: Text(
                  'Show Dialog',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
