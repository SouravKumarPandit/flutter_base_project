import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/services/response_handler.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/ui/utils/message_utils.dart';
import 'package:flutter_ui_control/indicator/progress_bar_widget.dart';
import 'package:provider/provider.dart';

abstract class BaseState<M extends BaseModel, T extends StatefulWidget>
    extends State<T> implements BaseStateHandler {
  M model;

  @override
  void initState() {
    super.initState();
    initModel();
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
  void handleResponse(int iActionId, Object responseObject) {}

  @override
  void showError(int iStatusCode, String sMessage) {
    CLMessageUtil.showMsg(context, "Error", sMessage,
        messageType: CLMessageUtil.ERROR);
  }

  @override
  void hideProgressbar() {
    model.setBusy(false);
  }

  @override
  void showProgressbar() {
    model.setBusy(true);
  }

  @override
  void dispose() {
    super.dispose();
    model.dispose();
  }

  List<Widget> reuseChildren();

  Widget stateWidgetBuilder(BuildContext context, ChildrenHolder childrenHolder);

  Widget _loadingProgressBuilder(
      BuildContext context,M baseModel, Widget childrenHolder) {
    return LoadingProgressWidget(
      showIndicator: model.busy,
      child: stateWidgetBuilder(context, childrenHolder),
    );
  }

}


class ChildrenHolder extends Widget {
  final List<Widget> children;

  ChildrenHolder(this.children);

  @override
  Element createElement() {
    return null;
  }
}
