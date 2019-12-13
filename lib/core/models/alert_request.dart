import 'package:flutter/material.dart';

class AlertRequest {
  final String title;
  final String description;
  final String buttonTitle;

  AlertRequest({
    this.title,
    this.description,
    this.buttonTitle,
  });
}
class AlertWidgetRequest  extends AlertRequest{
  final Widget titleWidget;
  final Widget contentWidget;
  final List<Widget> buttonTitleWidget;
//  final String title="";
//  final String description="";
//  final String buttonTitle="";

  AlertWidgetRequest ({
    this.titleWidget,
    this.contentWidget,
    this.buttonTitleWidget,
  });
}