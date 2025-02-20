
import 'dart:io';

import 'package:pronight_vendor/data/models/appLanguage.dart';
 String googleMapKey = Platform.isAndroid ? 'AIzaSyAKsBOGjbyzx6GtHD5RIB8yH3YACd9iWeg' : 'AIzaSyDUST4CnLw4ATyQSEYtrTLZHihkCzjK4d0';
 const String playStore ='https://play.google.com/store/apps/details?id=';
 const String appStore ='https://apps.apple.com/app/';
 const String appId ='';
 String createMapUrl(dynamic latitude,dynamic longitude) {
    String url = 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=18&size=300x300&maptype=roadmap&markers=color:green%7Clabel:L%7C$latitude,$longitude&key=$googleMapKey';
return url;
}


const String show ='show';
const String edit ='edit';
const String delete ='delete';
const String add ='add';
const String showIntro = 'showIntro';
const String localUserData ='localUserData';
const String localAppLanguage ='localAppLanguage';
const String appPackageName = 'com.app.serialCheckAdmin';
var appLanguage  = [
  AppLanguage('Arabic', 'Arabic', 'ar',''),
  AppLanguage('English', 'English', 'en',''),


];
