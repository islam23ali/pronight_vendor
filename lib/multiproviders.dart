import 'package:flutter/material.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/auth/auth_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/add_contract_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contracts_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/add_visit_permit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/visit_permit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/home_page/home_view_model.dart';
import 'package:pronight_vendor/presentations/modules/notification_screen/notification_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/change_language/language_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/unit_images_page/unit_image_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/update_profile/update_profile_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/setting_view_model.dart';
import 'package:pronight_vendor/presentations/modules/units_page/unit_details/one_unit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/units_page/units_view_model.dart';
import 'package:provider/provider.dart';
import 'core/islam_theme/islam_theme.dart';
import 'injection.dart';

class GenerateMultiProviders extends StatelessWidget {
  final Widget child;

  const GenerateMultiProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => getIt<LanguageViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ThemeNotifier>()),
        ChangeNotifierProvider(create: (_) => getIt<AuthViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<AddContractViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<AddVisitPermitViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<UnitImageViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<LanguageViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<AddUnitViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ContractViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<UnitsViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<OneUnitViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<VisitPermitViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<SettingsViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<NotificationsViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<UpdateProfileViewModel>()),
      ],
      child: child,
    );
  }
}
