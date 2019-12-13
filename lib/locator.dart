import 'package:flutter_base_project/core/services/authentication_service.dart';
import 'package:flutter_base_project/core/services/base_service/api_repository.dart';
import 'package:flutter_base_project/core/services/dialog_service.dart';
import 'package:flutter_base_project/core/services/login_services.dart';
import 'package:flutter_base_project/core/services/photo_services.dart';
import 'package:flutter_base_project/core/viewmodels/views/login_viewmodel.dart';
import 'package:flutter_base_project/core/viewmodels/views/photo_viewmodel.dart';
import 'package:flutter_base_project/core/viewmodels/widgets/comments_model.dart';
import 'package:flutter_base_project/managers/session_manager.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => ApiRepository());
  locator.registerLazySingleton(() => SessionManager());

  locator.registerFactory(() => AuthenticationService());
  locator.registerFactory(() => LoginService());
  locator.registerFactory(() => LoginViewModel());

  locator.registerFactory(() => PhotoViewModel());
  locator.registerFactory(() => CommentsModel());
  locator.registerFactory(() => PhotoService());
}
