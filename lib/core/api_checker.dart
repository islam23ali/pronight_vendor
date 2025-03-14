import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/api_response.dart';



class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    print("ooooo____${apiResponse.error.toString()}");
    if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
         }else {
      String _errorMessage;
      if (apiResponse.error is String) {
        _errorMessage = apiResponse.error.toString();
      } else {
        _errorMessage = apiResponse.error.errors[0].message;
      }
      print(_errorMessage);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));
    }
  }
}