import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_get_device_battery_percent_platform_interface.dart';

class MethodChannelFlutterGetDeviceBatteryPercent extends FlutterGetDeviceBatteryPercentPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_get_device_battery_percent');

  @override
  Future<int?> getBatteryLevel() async {
    final batteryLevel = await methodChannel.invokeMethod<int>('getBatteryLevel');
    return batteryLevel;
  }

  @override
  Future<String?> getFormattedDateTime(String dateTime) async {
    final formattedDate = await methodChannel.invokeMethod<String>(
      'formattedDateTime',
      <String, dynamic>{'dateTime': dateTime},
    );
    return formattedDate;
  }
}
