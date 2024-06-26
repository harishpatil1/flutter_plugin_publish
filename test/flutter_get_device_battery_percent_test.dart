import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_get_device_battery_percent/flutter_get_device_battery_percent.dart';
import 'package:flutter_get_device_battery_percent/flutter_get_device_battery_percent_platform_interface.dart';
import 'package:flutter_get_device_battery_percent/flutter_get_device_battery_percent_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterGetDeviceBatteryPercentPlatform
    with MockPlatformInterfaceMixin
    implements FlutterGetDeviceBatteryPercentPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterGetDeviceBatteryPercentPlatform initialPlatform = FlutterGetDeviceBatteryPercentPlatform.instance;

  test('$MethodChannelFlutterGetDeviceBatteryPercent is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterGetDeviceBatteryPercent>());
  });

  test('getPlatformVersion', () async {
    FlutterGetDeviceBatteryPercent flutterGetDeviceBatteryPercentPlugin = FlutterGetDeviceBatteryPercent();
    MockFlutterGetDeviceBatteryPercentPlatform fakePlatform = MockFlutterGetDeviceBatteryPercentPlatform();
    FlutterGetDeviceBatteryPercentPlatform.instance = fakePlatform;

    expect(await flutterGetDeviceBatteryPercentPlugin.getPlatformVersion(), '42');
  });
}
