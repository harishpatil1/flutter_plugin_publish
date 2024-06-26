import 'package:flutter/material.dart';
import 'package:flutter_get_device_battery_percent/flutter_get_device_battery_percent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final batteryService = FlutterGetDeviceBatteryPercent();
  String currentBatteryLevel = "Press button to get Battery level";
  String formattedDateTime = "Press button to get Formatted date";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Plugin Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Current battery level is : $currentBatteryLevel %"),
              const SizedBox(height: 20,),
              Text("Formatted date is : $formattedDateTime"),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  int? batteryLevel = await batteryService.getBatteryLevel();
                  print('Battery level: $batteryLevel');
                  setState(() {
                    currentBatteryLevel = batteryLevel?.toString() ?? "Error";
                  });
                },
                child: const Text('Get Battery Level'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? formattedDate = await batteryService.getFormattedDateTime('2023-06-20 15:30:00');
                  print('Formatted date: $formattedDate');
                  setState(() {
                    formattedDateTime = formattedDate ?? "Error";
                  });
                },
                child: const Text('Get Formatted Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
