import 'package:flutter_test/flutter_test.dart';
import 'package:freelance/freelance.dart';
import 'package:freelance/freelance_platform_interface.dart';
import 'package:freelance/freelance_method_channel.dart';
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
    Freelance freelancePlugin = Freelance();
    MockFreelancePlatform fakePlatform = MockFreelancePlatform();
    FreelancePlatform.instance = fakePlatform;

    expect(await freelancePlugin.getPlatformVersion(), '42');
  });
}
