
import 'package:firebase_core/firebase_core.dart';
import 'package:pronight_vendor/presentations/modules/splash/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' as l;
import 'package:flutter/material.dart' ;
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'core/constants/constants.dart';
import 'core/firebase_notification/notification_services.dart';
import 'injection.dart';
import 'multiproviders.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await init();
  await FlutterDownloader.initialize(
      debug: true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );
  runApp(GenerateMultiProviders(
      child: EasyLocalization(
        supportedLocales: appLanguage.map((e) => Locale(e.languageCode,e.countryCode)).toList(),
        startLocale: Locale(appLanguage[0].languageCode,appLanguage[0].countryCode),
        saveLocale: true,
        useOnlyLangCode: false,
        useFallbackTranslations: true,
        fallbackLocale: Locale(appLanguage[0].languageCode,appLanguage[0].countryCode),
        path: 'assets/languages',
        child: const MyApp(),
      )));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // notificationServices.init(context);
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Safe to use context-dependent logic here
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        // title:(context.locale.toString()=='en')?'Pronigh Investor':'الإبل',
        title:'Pronigh Investor',
        locale:context.locale ,
        theme: ThemeData(
    checkboxTheme: CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact, // Adjust density
    splashRadius: 20, // Adjust splash radius
    // side: BorderSide(width: 2, color: Colors.blue), // Custom border
    // Use `transform` to scale the checkbox
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),),
          splashColor: Colors.transparent, // Global splash color
          highlightColor: Colors.transparent, // Global highlight color
        ),
        themeMode: ThemeMode.light,
        // themeMode:  AppTheme.isDarkMode()?ThemeMode.dark:ThemeMode.light,
        supportedLocales: appLanguage.map((e) => Locale(e.languageCode,e.countryCode)).toList(),
        localizationsDelegates: context.localizationDelegates,
        localeResolutionCallback: (locale, supportedLocales) {
          print('localelocalelocalelocalelocalelocalelocale');
          print(locale);
          for (var supportedLocale in supportedLocales) {
            print('localelocalelocalelocalelocalelocalelocale2222222');
            print(supportedLocale);
            print(supportedLocales);
            if (supportedLocale.languageCode == locale?.languageCode) {
              print(supportedLocale);
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: const Splash(),
      );
  }

}
