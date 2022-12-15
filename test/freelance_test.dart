import 'package:flutter_test/flutter_test.dart';
import 'package:freelance/method_chanel/os_cummunicator.dart';
import 'package:freelance/method_chanel/freelance_platform_interface.dart';
import 'package:freelance/method_chanel/freelance_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFreelancePlatform
    with MockPlatformInterfaceMixin
    implements FreelancePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FreelancePlatform initialPlatform = FreelancePlatform.instance;

  test('$MethodChannelFreelance is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFreelance>());
  });

  test('getPlatformVersion', () async {
    MockFreelancePlatform fakePlatform = MockFreelancePlatform();
    FreelancePlatform.instance = fakePlatform;

    expect(await OSCommunicator.getPlatformVersion(), '42');
  });
}
