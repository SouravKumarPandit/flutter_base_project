import 'package:flutter_base_project/core/models/photos.dart';
import 'package:flutter_base_project/core/services/photo_services.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';
import 'package:flutter_base_project/locator.dart';

class PhotoViewModel extends BaseViewModel implements IPhotoView {
  PhotoService photoService = locator<PhotoService>();
  List<Photos> photos;

  Future<void> doSomeNetworkCall() async {
    showProgressbar();
    return await Future.delayed(Duration(seconds: 3)).then((_) {
      hideProgressbar();
    });
  }

  @override
  void onFetchPhotoList() async {
    photos = await photoService.fetchPhotoList(this);
  }

  @override
  void onLoadImageData() {
    return null;
  }
}
