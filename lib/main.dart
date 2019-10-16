import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/core/services/authentication_service.dart';
import 'package:flutter_base_project/locator.dart';
import 'package:flutter_base_project/managers/dialog_manager.dart';
import 'package:flutter_base_project/ui/router.dart';
import 'package:provider/provider.dart';
import 'core/models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
//          Todo change the theme based on app
          fontFamily: 'Montserrat',
//            primaryColor: primaryColor,
//            scaffoldBackgroundColor: primaryColor,
//          canvasColor: Colors.black,
        ),
        builder: (context, widget) => Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(
                    child: widget,
                  )),
        ),
        initialRoute: AppRouter.LOGIN,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
