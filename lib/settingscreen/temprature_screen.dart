import 'package:flutter/material.dart';
import 'dart:async';

import 'package:environment_sensors/environment_sensors.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_native_class.dart';

import '../screen/setting.dart';

class DeviceTempratureScreen extends StatefulWidget {
  @override
  _DeviceTempratureScreenState createState() => _DeviceTempratureScreenState();
}

class _DeviceTempratureScreenState extends State<DeviceTempratureScreen> {
  bool _tempAvailable = false;
  bool _humidityAvailable = false;
  bool _lightAvailable = false;
  bool _pressureAvailable = false;
  final environmentSensors = EnvironmentSensors();

  @override
  void initState() {
    super.initState();
    environmentSensors.pressure.listen((pressure) {
      print(pressure.toString());
    });
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool tempAvailable;
    bool humidityAvailable;
    bool lightAvailable;
    bool pressureAvailable;

    tempAvailable = await environmentSensors
        .getSensorAvailable(SensorType.AmbientTemperature);
    humidityAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Humidity);
    lightAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Light);
    pressureAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Pressure);

    setState(() {
      _tempAvailable = tempAvailable;
      _humidityAvailable = humidityAvailable;
      _lightAvailable = lightAvailable;
      _pressureAvailable = pressureAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 25,
            backgroundColor: const Color.fromARGB(255, 11, 16, 54),
            title: const Text(
              "Temperature Monitor",
              style: TextStyle(color: Colors.white, fontFamily: "Gugi"),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ), // Different icon for back button
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingListScreen(),
                    ));
              },
            ),
          ),
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (_tempAvailable)
                      ? StreamBuilder<double>(
                          stream: environmentSensors.humidity,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            return Text(
                                'The Current Humidity is: ${snapshot.data?.toStringAsFixed(2)}%');
                          })
                      : Text('No relative humidity sensor found'),
                  (_humidityAvailable)
                      ? StreamBuilder<double>(
                          stream: environmentSensors.temperature,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            return Text(
                                'The Current Temperature is: ${snapshot.data?.toStringAsFixed(2)}');
                          })
                      : Text('No temperature sensor found'),
                  (_lightAvailable)
                      ? StreamBuilder<double>(
                          stream: environmentSensors.light,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            return Text(
                                'The Current Light is: ${snapshot.data?.toStringAsFixed(2)}');
                          })
                      : Text('No light sensor found'),
                  (_pressureAvailable)
                      ? StreamBuilder<double>(
                          stream: environmentSensors.pressure,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            return Text(
                                'The Current Pressure is: ${snapshot.data?.toStringAsFixed(2)}');
                          })
                      : Text('No pressure sensure found'),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                  NativeAdWidget()
                  //ElevatedButton(onPressed: initPlatformState , child: Text('Get'))
                ]),
          )),
    );
  }
}
