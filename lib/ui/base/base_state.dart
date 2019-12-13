import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/ui/base/widget_size_config.dart';
import 'package:flutter_ui_control/indicator/progress_bar_widget.dart';
import 'package:provider/provider.dart';

abstract class BaseState<M extends BaseViewModel, T extends StatefulWidget>
    extends State<T> {
  M viewModel;
  SizeConfig sizeConfig;

  @override
  void initState() {
    super.initState();
    sizeConfig = new SizeConfig();
    initViewModel();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ChangeNotifierProvider<M>(
      create: (context) => viewModel,
      child: Consumer<M>(
        builder: _loadingProgressBuilder,
        child: ChildrenHolder(reuseChildren()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }

  Widget _loadingProgressBuilder(
      BuildContext context, M baseModel, Widget childrenHolder) {
 /*   Widget stateWidget;
    try {
      stateWidget = stateWidgetBuilder(context, childrenHolder);
    } catch (exception) {
      viewModel.showError(8080, exception.toString());
      stateWidget = Container(
        color: Colors.white,
        child: Icon(
          Icons.error_outline,
          color: const Color(0xFFFFCDD2),
        ),
      );
    }*/
    return LoadingProgressWidget(
      showIndicator: viewModel.busy,
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
