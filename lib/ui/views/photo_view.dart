import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_base_project/core/viewmodels/views/photo_viewmodel.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';
import 'package:flutter_base_project/ui/widgets/creation_aware_list_item.dart';
import 'package:provider/provider.dart';

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
  void initViewModel() {
    model = PhotoViewModel(photoService: Provider.of(context));
//    model.doSomeNetworkCall();
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
        body: model.photos != null
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemCount: this.model.photos.length,
                itemBuilder: gridItemBuilder,
              )
            : Center(
                child: RaisedButton(
                  onPressed: model.onFetchPhotoList,
                  child: Text("GET PHOTO"),
                ),
              ));
  }

  Widget gridItemBuilder(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(0.5),
      borderOnForeground: true,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.8,
            child: Image.network(
              model.photos[index].url,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "title $index",
                style: TextStyle(color: Colors.white),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
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
