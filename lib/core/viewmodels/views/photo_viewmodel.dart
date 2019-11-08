import 'package:flutter_base_project/core/models/photos.dart';
import 'package:flutter_base_project/core/services/photo_services.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';

const String LoadingIndicatorTitle = '^';

class PhotoViewModel extends BaseViewModel implements IPhotoView {
  PhotoService photoService;

  PhotoViewModel({this.photoService});

  List<Photos> photos;

  Future<void> doSomeNetworkCall() async {
    showProgressbar();
    return await Future.delayed(Duration(seconds: 3)).then((_) {
      _items = List<String>.generate(25, (index) => 'Title $index');
      taskLoaded = true;
      hideProgressbar();
    });
  }

  bool taskLoaded = false;

  static const int ItemRequestThreshold = 15;

  List<String> _items;

  List<String> get items => _items;

  int _currentPage = 0;

  Future handleItemCreated(int index) async {
    var itemPosition = index + 1;
    var requestMoreData =
        itemPosition % ItemRequestThreshold == 0 && itemPosition != 0;
    var pageToRequest = itemPosition ~/ ItemRequestThreshold;

    if (requestMoreData && pageToRequest > _currentPage) {
      print('handleItemCreated | pageToRequest: $pageToRequest');
      _currentPage = pageToRequest;
      _showLoadingIndicator();

      await Future.delayed(Duration(seconds: 2));
      var newFetchedItems = List<String>.generate(
          15, (index) => 'Title page:$_currentPage item: $index');
      _items.addAll(newFetchedItems);

      _removeLoadingIndicator();
    }
  }

  void _showLoadingIndicator() {
    notifyListeners();
  }

  void _removeLoadingIndicator() {
    notifyListeners();
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
