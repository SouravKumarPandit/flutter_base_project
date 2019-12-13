import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/viewmodels/views/login_viewmodel.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';
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

  void showDefaultDialog() {
    viewModel.showError(455, "Detox");
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Theme(
            data: ThemeData.light().copyWith(
                buttonTheme: ButtonThemeData(
              buttonColor: Colors.green,
              textTheme: ButtonTextTheme.primary,
            )),
            child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  onPressed: showDefaultDialog,
                  child: Text("SHOW NETWORK MESSAGE"),
                ),
                RaisedButton(
                  onPressed: showCustomMessage,
                  child: Text("SHOW CUSTOM MESSAGE"),
                ),
                RaisedButton(
                  onPressed: showCustomWidgetDialog,
                  child: Text("SHOW WIDGET DIALOG"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCustomMessage() {
    viewModel.showCustomErrorMessage(
        title: "Custom title",
        message:
            "Hello, this is custom message , to show some custom dialog over the ");
  }

  void showCustomDialog() {
    viewModel.showCustomErrorMessage();
  }

  void showCustomWidgetDialog() {
    viewModel.showCustomDialog(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Custom Widget",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        message: Container(
          child: Wrap(
            children: <Widget>[
              Text(
                  "Some valuable insperation come from Crazy places , Happy coder is good coder"),
              TextFormField(),
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0))),
            onPressed: () {

//              viewModel.showProgressbar();
            viewModel.closeDialog();
            },
            child: Padding(
              padding:
//                  const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                  const EdgeInsets.all(10),
              child: Text(
                "OK",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ]);
  }
}

/*
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
              onPressed: () {
                print("------------------------------------------------------------------------------");
                viewModel.authenticateUser(_controller.text);
                viewModel.isValidUser.listen(navigateToHomePage).onError(showInvalidUser);
              },
            )
          ],
        ));
  }
int times=0;
  void navigateToHomePage(bool event) {
    times++;
    if (event)
//      Navigator.pushNamedAndRemoveUntil(context, AppRouter.HOME,    ModalRoute.withName('/'),);
      Navigator.pushNamed(context, AppRouter.HOME);
  }

  showInvalidUser(error) {
    viewModel.showError(-101,
        "Sorry but you are not the valid user try number between 2 to 10");
  }
}*/
