import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
// import '../services/storage_manager.dart';
class StorageManager {
  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    hintColor: Colors.white,
    dividerColor: Colors.black12,
    colorScheme:const ColorScheme.dark(
      primary: Colors.grey,
      background: Color(0xFF212121),
    ),
  );
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    hintColor: Colors.black,
    dividerColor: Colors.white54,
    colorScheme:const ColorScheme.light(
      primary: Colors.grey,
      background: Color(0xFFE5E5E5),
    ),
  );
  late ThemeData _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  ThemeData getTheme() => _themeData;

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}


class IslamTheme extends StatelessWidget {
  const IslamTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hybrid Theme'),
          ),
          body: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: CustomButton(width: 100,
                  onTap: () => {
                    print('Set Light Theme'),
                    theme.setLightMode(),
                  },
                  title: 'Set Light Theme',
                ),
              ),
              Container(
                child: CustomButton(width: 100,
                  onTap: () => {
                    print('Set Dark theme'),
                    theme.setDarkMode(),
                  },
                  title: 'Set Dark theme',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
