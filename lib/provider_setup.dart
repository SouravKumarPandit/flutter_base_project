import 'package:flutter_base_project/core/models/user.dart';
import 'package:flutter_base_project/core/services/api.dart';
import 'package:flutter_base_project/core/services/authentication_service.dart';
import 'package:flutter_base_project/core/services/base_service/api_repository.dart';
import 'package:flutter_base_project/core/services/photo_services.dart';
import 'package:provider/provider.dart';


List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api()),
  Provider.value(value: ApiRepository())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  ),
  ProxyProvider<ApiRepository, PhotoService>(
    builder: (context, apiRepository, authenticationService) =>
        PhotoService(apiRepository),
  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
  )
];
