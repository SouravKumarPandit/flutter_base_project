import 'package:flutter_base_project/core/services/base_service/api_repository.dart';
import 'package:flutter_base_project/core/viewmodels/base_model.dart';

class PhotoService extends ApiRepository{
  ApiRepository apiRepository;

  @override
  void onResponse(responseJson) {
    print(responseJson);
  }

  PhotoService(this.apiRepository);


}
