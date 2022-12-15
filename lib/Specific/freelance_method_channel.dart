import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freelance/method_chanel/freelance_platform_interface.dart';

/// An implementation of [FreelancePlatform] that uses method channels.
class MethodChannelFreelance extends FreelancePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('freelance');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
