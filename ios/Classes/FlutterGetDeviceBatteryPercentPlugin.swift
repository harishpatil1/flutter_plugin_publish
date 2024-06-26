import Flutter
import UIKit

public class FlutterGetDeviceBatteryPercentPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_get_device_battery_percent", binaryMessenger: registrar.messenger())
    let instance = FlutterGetDeviceBatteryPercentPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getBatteryLevel":
      receiveBatteryLevel(result: result)
    case "formattedDateTime":
      if let arguments = call.arguments as? [String: Any],
         let inputDateTime = arguments["dateTime"] as? String {
        let formattedDate = formatDate(inputDateTime: inputDateTime)
        result(formattedDate)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "DateTime argument is missing or invalid.", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func receiveBatteryLevel(result: FlutterResult) {
    #if targetEnvironment(simulator)
    result(100) // Return a dummy value for simulator
    #else
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryState == UIDevice.BatteryState.unknown {
      result(FlutterError(code: "UNAVAILABLE", message: "Battery level not available.", details: nil))
    } else {
      result(Int(device.batteryLevel * 100))
    }
    #endif
  }

  private func formatDate(inputDateTime: String) -> String {
    let inputFormat = DateFormatter()
    inputFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"

    let outputFormat = DateFormatter()
    outputFormat.dateFormat = "yyyy:MM:dd"

    if let date = inputFormat.date(from: inputDateTime) {
      return outputFormat.string(from: date)
    } else {
      return "Error formatting date"
    }
  }
}
