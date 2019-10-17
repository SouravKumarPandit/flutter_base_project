import 'package:flutter_base_project/core/enums/viewstate.dart';
import 'package:flutter_base_project/core/models/comment.dart';
import 'package:flutter_base_project/core/services/api.dart';
import 'package:flutter_base_project/locator.dart';

import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api _api =  locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = (await _api.getCommentsForPost(postId)).cast<Comment>();
    setState(ViewState.Idle);
  }
}
