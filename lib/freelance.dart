import 'freelance_platform_interface.dart';

class Freelance {
  static Future<String?> getPlatformVersion() {
    return FreelancePlatform.instance.getPlatformVersion();
  }
}
