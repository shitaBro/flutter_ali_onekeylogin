import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ali_onekeylogin/flutter_ali_onekeylogin.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_ali_onekeylogin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterAliOnekeylogin.platformVersion, '42');
  });
}
