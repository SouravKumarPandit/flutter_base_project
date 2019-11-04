import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, ReusableChildren child) builder;
  final T model;
  final ReusableChildren reuseChildren;//this is reusable widget which will not re created once rendered
  final Function(T) onModelReady;
  BaseWidget({
    Key key,
    this.builder,
    this.model,
    this.reuseChildren,
    this.onModelReady,
  }) : super(key: key);
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}
class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T model;
  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.reuseChildren,
      ),
    );
  }
}
class ReusableChildren extends Widget{
  List<Widget> reuseChildren;
  @override
  Element createElement() {
    return null;
  }

  ReusableChildren(this.reuseChildren);


}