import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/core/enums/viewstate.dart';
import 'package:flutter_base_project/core/services/dialog_service.dart';
import 'package:flutter_base_project/locator.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  var _dialogService=locator<DialogService>();
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future disconnectedDialog() async {
    var dialogResult = await _dialogService.showDialog(
        title: 'Whoops!',
        description:
        'No Internet connection found.Check\n Your connectuin and try again.');

    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }
}
