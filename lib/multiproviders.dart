import 'package:flutter/material.dart';
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
      ],
      child: child,
    );
  }
}
