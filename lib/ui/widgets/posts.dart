import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/core/viewmodels/widgets/posts_model.dart';
import 'package:flutter_base_project/ui/base/base_widget.dart';
import 'package:flutter_base_project/ui/router.dart';
import 'package:flutter_base_project/ui/widgets/postlist_item.dart';
import 'package:provider/provider.dart';

class Posts extends StatelessWidget {
  const Posts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsModel>(
        model: PostsModel(api: Provider.of(context)),
        onModelReady: (model) => model.getPosts(Provider.of<User>(context)?.id),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: model.posts.length,
                itemBuilder: (context, index) => PostListItem(
                      post: model.posts[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.POST,
                          arguments: model.posts[index],
                        );
                      },
                    ),
              ));
  }
}
