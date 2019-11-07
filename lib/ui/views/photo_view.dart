import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/viewmodels/views/photo_viewmodel.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';
import 'package:flutter_base_project/ui/base/base_widget.dart';

class PhotoView extends StatefulWidget {
  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends BaseState<PhotoViewModel,PhotoView> {

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  Future<void> onPageRefresh() {
    return Future.delayed(Duration(seconds: 3));
  }

  Widget gridItemBuilder(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(1),
      child: Center(child: Text("text $index")),
    );
  }

  @override
  Widget stateWidgetBuilder(BuildContext context, PhotoViewModel value, ChildrenHolder childrenHolder) {
    return Scaffold(
        appBar: AppBar(
          title: childrenHolder.children[5]??Text("Photo"),
        ),
        body: RefreshIndicator(
          onRefresh: onPageRefresh,
          child: BaseWidget(
            model: PhotoViewModel(),
            builder: (context, model, onModelReady) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemCount: 50,
                itemBuilder: gridItemBuilder,
              );
            },
          ),
        ));
  }

  @override
  void initModel() {
   model=PhotoViewModel();
   model.doSomeNetworkCall();
  }

  @override
  List<Widget> reuseChildren() {
    return [
      Text("Hello 1"),
      Text("Hello 2"),
      Text("Hello 3"),
      Text("Hello 4"),
      Text("Hello 5"),
      Text("Hello 6"),

    ];
  }

}
