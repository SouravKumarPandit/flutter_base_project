import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/viewmodels/views/login_viewmodel.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';
import 'package:flutter_base_project/ui/router.dart';
import 'package:flutter_base_project/ui/shared/app_colors.dart';
import 'package:flutter_base_project/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginViewModel, LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initViewModel() {
    viewModel = LoginViewModel();
  }

  @override
  List<Widget> reuseChildren() {
    return [LoginHeader(controller: _controller)];
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            childrenHolder.children[0],
            FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                var loginSuccess = await viewModel.login(_controller.text);
                if (loginSuccess) {
                  Navigator.pushNamed(context, AppRouter.HOME);
                }
              },
            )
          ],
        ));
  }
}
