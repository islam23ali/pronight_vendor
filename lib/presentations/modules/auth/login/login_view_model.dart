import 'dart:async';

import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier{
  TextEditingController phoneNumberController =TextEditingController();
  final controller = TextEditingController();
  late Timer timer;
  int start = 60;

  void startTimer() {
    start = 60;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          timer.cancel();
          notifyListeners();
        } else {
          start--;
          notifyListeners();
        }
      },
    );
  }
}