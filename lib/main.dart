import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/locator.dart';
import 'package:flutter_base_project/managers/dialog_manager.dart';
import 'package:flutter_base_project/ui/router.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: widget,
          ),
        ),
      ),
      initialRoute: AppRouter.PHOTO,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
