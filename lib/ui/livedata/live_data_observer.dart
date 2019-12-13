import 'package:flutter/rendering.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';

class LiveData<T> {
  T _value;
  IBaseView _viewModel;
  bool _toInvalidate = true;

  T get value => _value; //  M _observer;
  ValueChanged<T> _onChange;

  void listener(IBaseView viewModel, ValueChanged<T> listener,
      [bool toInvalidate = true]) {
    this._viewModel = viewModel;
    this._onChange = listener;
    this._toInvalidate = toInvalidate;
  }

  void removeListener(IBaseView viewModel) {
    _onChange = null;
  }

  void emitValue(T value) {
    _value = value;
    if (_onChange != null) {
      _onChange(value);
    }
    if (_viewModel != null && _toInvalidate == true) _viewModel.invalidate();
  }

  LiveData({T value}) {
    if (value != null) {
      this._value = value;
    }
  }
}
//------------------------------------------------------------- Mutable Data --------------------------------------------------------------
/*
class MultiLiveData<T> {
  T _value;
  IBaseView _viewModel;
  bool _toInvalidate = true;

  T get value => _value; //  M _observer;
  List<ValueChanged<T>> _onChanges;

  void listener(IBaseView viewModel, ValueChanged<T> listener,
      [bool toInvalidate = true]) {
    this._viewModel = viewModel;
    if (this._onChanges == null) {
      _onChanges = [];
    }
    this._onChanges.add(listener);
    this._toInvalidate = toInvalidate;
  }

  void removeListener(IBaseView viewModel) {
    _onChanges = null;
  }

  void emitValue(T value) {
    _value = value;
    if (_onChanges != null && _onChanges.length > 0) {
      _onChanges.forEach((onChange) {
        onChange(value);
      });
    }
    if (_viewModel != null && _toInvalidate == true) _viewModel.invalidate();
  }

  LiveData({T value}) {
    if (value != null) {
      this._value = value;
    }
  }
}
*/
