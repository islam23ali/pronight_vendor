import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pronight_vendor/data/repositories/contract_repo.dart';
import 'package:pronight_vendor/data/repositories/units_repo.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/auth/login/login_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/add_contract_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contracts_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/add_visit_permit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/change_language/language_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/unit_images_page/unit_image_view_model.dart';
import 'package:pronight_vendor/presentations/modules/units_page/unit_details/one_unit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/units_page/units_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/islam_theme/islam_theme.dart';
import 'data/datasource/local/LocalUserData.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repositories/login_repo.dart';
final getIt = GetIt.instance;

Future<void> init() async{
  ///preference
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  ///network
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => DioClient());
  getIt.registerLazySingleton(() => LocalUserData());
  getIt.registerLazySingleton(() => LoginViewModel());
  getIt.registerLazySingleton(() => AddContractViewModel());
  getIt.registerLazySingleton(() => AddVisitPermitViewModel());
  getIt.registerLazySingleton(() => UnitImageViewModel());
  getIt.registerLazySingleton(() => LanguageViewModel());
  getIt.registerLazySingleton(() => AddUnitViewModel());
  getIt.registerLazySingleton(() => ContractViewModel());
  getIt.registerLazySingleton(() => UnitsViewModel());
  getIt.registerLazySingleton(() => OneUnitViewModel());
  ///providers
  // getIt.registerLazySingleton(() => LanguageViewModel());

  getIt.registerLazySingleton(() => ThemeNotifier());

  ///repositories
  getIt.registerLazySingleton(() => LoginRepo());
  getIt.registerLazySingleton(() => ContractRepo());
  getIt.registerLazySingleton(() => UnitsRepo());

}