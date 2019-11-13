import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/models/comment.dart';
import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/core/viewmodels/widgets/comments_model.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';
import 'package:flutter_base_project/ui/router.dart';
import 'package:flutter_base_project/ui/shared/app_colors.dart';
import 'package:flutter_base_project/ui/shared/ui_helpers.dart';
import 'package:provider/provider.dart';

class Comments extends StatefulWidget {
  final int postId;

  Comments(this.postId);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends BaseState<CommentsModel, Comments> {
  @override
  void initViewModel() {
    viewModel = CommentsModel();
    viewModel.fetchComments(widget.postId);
  }

  @override
  List<Widget> reuseChildren() {
    return [];
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return viewModel.comments == null
        ? Container()
        : ListView.builder(
            itemCount: viewModel.comments.length,
            itemBuilder: (context, index) =>
                InkWell( onTap :doSomeTask,child: CommentItem(viewModel.comments[index])),
          );
  }

  void doSomeTask() {
    Navigator.pushNamed(
      context,
      AppRouter.PHOTO,
      arguments: Provider.of<User>(context),
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }
}
