import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/enums/viewstate.dart';
import 'package:flutter_base_project/core/viewmodels/login_model.dart';
import 'package:flutter_base_project/ui/shared/app_colors.dart';
import 'package:flutter_base_project/ui/widgets/login_header.dart';

import 'base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            LoginHeader(
              validationMessage: model.errorMessage,
              controller: _controller),
            model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : FlatButton(
              color: Colors.white,
              child: Text(
                'Your name',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                var loginSuccess = await model.login(_controller.text);
                if(loginSuccess){
                  Navigator.pushNamed(context, '/');
                }
              },
            )
          ],),
        ),
    );
  }
}
