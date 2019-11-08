import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/viewmodels/views/login_viewmodel.dart';
import 'package:flutter_base_project/ui/base/base_widget.dart';
import 'package:flutter_base_project/ui/router.dart';
import 'package:flutter_base_project/ui/shared/app_colors.dart';
import 'package:flutter_base_project/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(),
      child: LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              child,
              model.busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.white,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        var loginSuccess = await model.login(_controller.text);
                        if (loginSuccess) {
                          Navigator.pushNamed(context, AppRouter.HOME);
                        }
                      },
                    )
            ],
          )),
    );
  }

  List<Widget> getChildrenObjects() {
    return [LoginHeader(controller: _controller)];
  }
}
