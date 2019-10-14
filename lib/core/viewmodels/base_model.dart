import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/core/enums/viewstate.dart';
import 'package:flutter_base_project/core/services/dialog_service.dart';
import 'package:flutter_base_project/locator.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

}
