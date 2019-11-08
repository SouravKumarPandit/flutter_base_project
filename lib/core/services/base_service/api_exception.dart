import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(IBaseView model, [String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException(IBaseView model, [String message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(IBaseView model,[String message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException(IBaseView model,[String message]) : super(message, "Invalid Input: ");
}