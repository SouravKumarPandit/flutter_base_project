import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/viewmodels/widgets/posts_model.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';
import 'package:flutter_base_project/ui/router.dart';
import 'package:flutter_base_project/ui/widgets/postlist_item.dart';

class Posts extends StatefulWidget {
  final int id;

  const Posts(this.id, {Key key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends BaseState<PostsViewModel, Posts> {
  @override
  void initViewModel() {
    viewModel = PostsViewModel();
    if(widget.id!=null&&widget.id>0){
      viewModel.getPosts(widget.id);
    }
  }

  @override
  List<Widget> reuseChildren() {
    return null;
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return viewModel.posts != null
        ? ListView.builder(
            itemCount: viewModel.posts.length,
            itemBuilder: (context, index) => PostListItem(
              post: viewModel.posts[index],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.POST,
                  arguments: viewModel.posts[index],
                );
              },
            ),
          )
        : Center(
            child: InkWell(
                onTap: () {
                  viewModel.getPosts(widget.id);
                },
                child: Text('No data')),
          );
  }
}
