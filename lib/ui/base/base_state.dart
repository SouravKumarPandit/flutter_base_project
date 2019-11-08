import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_ui_control/indicator/progress_bar_widget.dart';
import 'package:provider/provider.dart';

abstract class BaseState<M extends BaseViewModel, T extends StatefulWidget>
    extends State<T> {
  M model;

  @override
  void initState() {
    super.initState();
    initViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<M>(
      builder: (context) => model,
      child: Consumer<M>(
        builder: _loadingProgressBuilder,
        child: ChildrenHolder(reuseChildren()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    model.dispose();
  }

  Widget _loadingProgressBuilder(
      BuildContext context, M baseModel, Widget childrenHolder) {
    return LoadingProgressWidget(
      showIndicator: model.busy,
      child: stateWidgetBuilder(context, childrenHolder),
    );
  }
///abstraction layer very important
  void initViewModel();
  List<Widget> reuseChildren();
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder);
}

/// <h2>Get <strong> expensive </strong>child list here and reuse it in builder method</h28>
class ChildrenHolder extends Widget {
  final List<Widget> children;

  ChildrenHolder(this.children);

  @override
  Element createElement() {
    return null;
  }
}
