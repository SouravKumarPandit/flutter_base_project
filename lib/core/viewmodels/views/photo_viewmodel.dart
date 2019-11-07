import 'package:flutter_base_project/core/viewmodels/base_model.dart';
const String LoadingIndicatorTitle = '^';
class PhotoViewModel extends BaseModel {
  Future<void> doSomeNetworkCall() async {
    setBusy(true);
   return await Future.delayed(Duration(seconds: 10)).then((_) {
      setBusy(false);
    });
  }




  static const int ItemRequestThreshold = 15;

  List<String> _items;
  List<String> get items => _items;

  int _currentPage = 0;

  HomeViewModel() {
    _items = List<String>.generate(15, (index) => 'Title $index');
  }

  Future handleItemCreated(int index) async {
    var itemPosition = index + 1;
    var requestMoreData =
        itemPosition % ItemRequestThreshold == 0 && itemPosition != 0;
    var pageToRequest = itemPosition ~/ ItemRequestThreshold;

    if (requestMoreData && pageToRequest > _currentPage) {
      print('handleItemCreated | pageToRequest: $pageToRequest');
      _currentPage = pageToRequest;
      _showLoadingIndicator();

      await Future.delayed(Duration(seconds: 5));
      var newFetchedItems = List<String>.generate(
          15, (index) => 'Title page:$_currentPage item: $index');
      _items.addAll(newFetchedItems);

      _removeLoadingIndicator();
    }
  }

  void _showLoadingIndicator() {
    _items.add(LoadingIndicatorTitle);
    notifyListeners();
  }

  void _removeLoadingIndicator() {
    _items.remove(LoadingIndicatorTitle);
    notifyListeners();
  }

}
