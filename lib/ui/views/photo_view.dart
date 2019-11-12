import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/core/viewmodels/views/photo_viewmodel.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';

class PhotoView extends StatefulWidget {
  final User user;
  PhotoView(this.user);

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
    viewModel = PhotoViewModel();
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
          title: childrenHolder.children[0] ?? Text("Photo"),
        ),
        body: viewModel.photos != null
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemCount: this.viewModel.photos.length,
                itemBuilder: gridItemBuilder,
              )
            : Center(
                child: RaisedButton(
                  onPressed: viewModel.onFetchPhotoList,
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
              viewModel.photos[index].url,
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
      Text("Hello ${widget.user.name}"),
    ];
  }
}
