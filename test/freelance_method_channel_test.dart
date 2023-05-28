import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freelance/method_channels/freelance_method_channel.dart';

void main() {
  MethodChannelFreelance platform = MethodChannelFreelance();
  const MethodChannel channel = MethodChannel('freelance');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
