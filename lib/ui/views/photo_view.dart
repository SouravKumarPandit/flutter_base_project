import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_base_project/core/viewmodels/views/photo_viewmodel.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';
import 'package:flutter_base_project/ui/base/base_widget.dart';
import 'package:flutter_base_project/ui/widgets/creation_aware_list_item.dart';

class PhotoView extends StatefulWidget {
  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends BaseState<PhotoViewModel, PhotoView> {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void initModel() {
    model = PhotoViewModel();
    model.doSomeNetworkCall();
  }

  Future<void> onPageRefresh() {
    return Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return Scaffold(
      appBar: AppBar(
        title: childrenHolder.children[2] ?? Text("Photo"),
      ),
      body: BaseWidget(
        model: PhotoViewModel(),
        builder: (context, model, onModelReady) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemCount: this.model.items.length,
            itemBuilder: gridItemBuilder,
          );
        },
      ),
    );
  }

  Widget gridItemBuilder(BuildContext context, int index) {
    return CreationAwareListItem(
      itemCreated: () {
        SchedulerBinding.instance
            .addPostFrameCallback((duration) => model.handleItemCreated(index));
      },
      child: ListItem(
        title: model.items[index],
      ),
    );
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

class ListItem extends StatelessWidget {
  final String title;

  const ListItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: Colors.grey[400],
            ),
          ],
          borderRadius: BorderRadius.circular(5)),
      child: title == LoadingIndicatorTitle
          ? CircularProgressIndicator()
          : Text(title),
      alignment: Alignment.center,
    );
  }
}
