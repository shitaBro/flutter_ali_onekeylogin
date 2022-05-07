import Flutter
import UIKit

public class SwiftFlutterAliOnekeyloginPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ali_onekeylogin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAliOnekeyloginPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
