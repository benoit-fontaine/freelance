import 'freelance_platform_interface.dart';

class OSCommunicator {
  static Future<String?> getPlatformVersion() {
    return FreelancePlatform.instance.getPlatformVersion();
  }
}
