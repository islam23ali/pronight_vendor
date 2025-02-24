import 'package:flutter/material.dart';
import 'package:pronight_vendor/presentations/modules/auth/login/login_view_model.dart';
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
        ChangeNotifierProvider(create: (_) => getIt<LoginViewModel>()),
      ],
      child: child,
    );
  }
}
