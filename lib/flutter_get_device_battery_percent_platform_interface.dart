import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_get_device_battery_percent_method_channel.dart';

abstract class FlutterGetDeviceBatteryPercentPlatform extends PlatformInterface {
  FlutterGetDeviceBatteryPercentPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterGetDeviceBatteryPercentPlatform _instance = MethodChannelFlutterGetDeviceBatteryPercent();

  static FlutterGetDeviceBatteryPercentPlatform get instance => _instance;

  static set instance(FlutterGetDeviceBatteryPercentPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }

  Future<String?> getFormattedDateTime(String dateTime) {
    throw UnimplementedError('getFormattedDateTime() has not been implemented.');
  }
}
