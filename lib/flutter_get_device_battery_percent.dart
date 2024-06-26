import 'flutter_get_device_battery_percent_platform_interface.dart';

class FlutterGetDeviceBatteryPercent {
  Future<int?> getBatteryLevel() {
    return FlutterGetDeviceBatteryPercentPlatform.instance.getBatteryLevel();
  }

  Future<String?> getFormattedDateTime(String dateTime) {
    return FlutterGetDeviceBatteryPercentPlatform.instance.getFormattedDateTime(dateTime);
  }
}
