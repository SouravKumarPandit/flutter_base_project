import 'package:flutter/rendering.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';

class LiveData<T> {
  T _value;
  IBaseView _viewModel;

  T get value => _value; //  M _observer;
  ValueChanged<T> _onChange;

  void listener(IBaseView viewModel, ValueChanged<T> listener) {
    this._viewModel = viewModel;
    this._onChange = listener;
  }

  void removeListener(IBaseView viewModel) {
    _onChange = null;
  }

  void emitValue(T value) {
    _value = value;
    if (_onChange != null) {
      _onChange(value);
    }
    if (_viewModel != null) _viewModel.invalidate();
  }

  LiveData({T value}) {
    if (value != null) {
      this._value = value;
    }
  }
}
