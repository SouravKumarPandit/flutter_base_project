import 'package:flutter_base_project/core/models/comment.dart';
import 'package:flutter_base_project/core/services/api.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/locator.dart';

class CommentsModel extends BaseViewModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setBusy(true);
    comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
