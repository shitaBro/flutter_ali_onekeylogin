import Flutter
import UIKit
import ATAuthSDK
public class SwiftFlutterAliOnekeyloginPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
    
    
    var _eventSink:FlutterEventSink?
    var _result:FlutterResult?
    var _callData:FlutterMethodCall?
    var _model:TXCustomModel?
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ali_onekeylogin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAliOnekeyloginPlugin()
      let eventChannel = FlutterEventChannel(name: "flutter_ali_onekeylogin/event", binaryMessenger: registrar.messenger())
      eventChannel.setStreamHandler(instance)
    registrar.addMethodCallDelegate(instance, channel: channel)
      SwiftFlutterAliOnekeyloginPlugin().httpTest()
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      _callData = call
      _result = result
      if call.method == "getPlatformVersion" {
          result("iOS " + UIDevice.current.systemVersion)
      }else if call.method == "initSDK" {
          initSDK()
      }
    
  }
    func initSDK() {
        let dic = _callData?.arguments
    }
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        
    }
    
    public func httpTest() {
        let urlstr = "https://www.baidu.com"
        let request = URLRequest(url: URL(string: urlstr)!)
        let session = URLSession.shared
      let task =  session.dataTask(with: request) { data, resp, error in
          if error == nil {
              print("联网成功")
          }else {
              print("联网失败")
          }
        }
        task.resume()
    }
}
