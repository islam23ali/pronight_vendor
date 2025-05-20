import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/presentations/modules/splash/splash.dart';
import '../../../../../../../../../../../core/navigator/navigator.dart';
import '../../../../../../../../../../../data/datasource/local/LocalUserData.dart';
import '../../../../../../../../../../../injection.dart';


class LanguageViewModel with ChangeNotifier {
  LocalUserData saveUserData=getIt();
  Locale locale = const Locale('ar');
  void changeLocale(context,String? languageCode)async {
    locale = Locale(languageCode!);
    EasyLocalization.of(context)!.setLocale(Locale(languageCode));
   await saveUserData.saveLang(languageCode);
    NavigatorHandler.pushAndRemoveUntil(const Splash());
    notifyListeners();
  }

}