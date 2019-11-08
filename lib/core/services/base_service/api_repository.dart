import 'package:flutter_base_project/core/services/base_service/api_constants.dart';
import 'package:flutter_base_project/core/services/base_service/api_exception.dart';
import 'package:flutter_base_project/core/viewmodels/views/view_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ApiRepository {
//  final String _baseUrl = "https://jsonplaceholder.typicode.com";
  Future<dynamic> getRequest(IBaseView model, String url) async {
    var responseJson;
    try {
      model.showProgressbar();
      final response = await http.get(ApiConstants.BASE_URL.appendUrl(url));
      switch (response.statusCode) {
        case 200:
          model.hideProgressbar();
          return response.body.toString();
        case 400:
          model.hideProgressbar();
          model.showError(400, "BadRequestException");
          throw BadRequestException(model, response.body.toString());

        case 401:
        case 403:
        model.hideProgressbar();
        throw UnauthorisedException(model, response.body.toString());
        case 500:
        default:
        model.hideProgressbar();
        model.showError(-1, "FetchDataException");
        throw FetchDataException(model,
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } on SocketException {
      throw FetchDataException(model, 'No Internet connection');
    }
  }

}
