import 'package:flutter_base_project/core/models/photos.dart';
import 'package:flutter_base_project/core/services/base_service/api_constants.dart';
import 'package:flutter_base_project/core/services/base_service/api_repository.dart';

class PhotoService extends ApiRepository{

  Future<List<Photos>> fetchPhotoList(model) async {
    final response = await getRequest(model ,ApiConstants.GET_PHOTO);
    return photosFromJson(response);
  }
}
