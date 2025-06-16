import UIKit
import Flutter
import GoogleMaps
import Firebase
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure()
      sleep(0)
      GMSServices.provideAPIKey("AIzaSyBJ4shhmSia3lS_qlIeueaCeYBg7-LUiF4")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
