
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAliOnekeylogin {
  static const MethodChannel _channel = MethodChannel('flutter_ali_onekeylogin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
