
import 'freelance_platform_interface.dart';

class Freelance {
  Future<String?> getPlatformVersion() {
    return FreelancePlatform.instance.getPlatformVersion();
  }
}
