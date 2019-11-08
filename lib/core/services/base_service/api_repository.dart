import 'dart:convert';

import 'package:flutter_base_project/core/services/base_service/api_constants.dart';
import 'package:flutter_base_project/core/services/base_service/api_exception.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ApiRepository {
  Future<dynamic> getRequest(IBaseView baseView, String url) async {
    var responseJson;
    try {
      baseView.showProgressbar();
      final response = await http.get(ApiConstants.BASE_URL.appendUrl(url));
      responseJson = _returnResponse(baseView, response);
      baseView.hideProgressbar();
    } on SocketException {
      baseView.hideProgressbar();
      throw FetchDataException('No Internet connection or methord does\'t exist');
    }
    return responseJson;
  }

  dynamic _returnResponse(IBaseView baseView, http.Response response) {
    switch (response.statusCode) {
      case 200:
//        var responseJson = json.decode(response.body.toString());
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        baseView.showError(400, response.body.toString());
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        baseView.showError(403, response.body.toString());
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        baseView.showError(500,
            "Error occured while Communication with Server with StatusCode : ${response.statusCode}");
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}