import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/islam_theme/islam_theme.dart';
import 'data/datasource/local/LocalUserData.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repositories/setting_repository.dart';
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
  ///providers
  // getIt.registerLazySingleton(() => LanguageViewModel());

  getIt.registerLazySingleton(() => ThemeNotifier());

  ///repositories
  getIt.registerLazySingleton(() => SettingRepository());

}