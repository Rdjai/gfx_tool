import 'package:flutter/material.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_native_class.dart';
import 'package:gfx_optimizer/screen/home_page.dart';
import 'package:gfx_optimizer/settingscreen/close_running_app.dart';
import 'package:gfx_optimizer/settingscreen/graphic_optimization.dart';
import 'package:gfx_optimizer/settingscreen/internet_speed_test.dart';
import 'package:gfx_optimizer/settingscreen/temprature_screen.dart';
import 'package:gfx_optimizer/widgets/list_widget.dart';

import '../settingscreen/fps_monitor_screen.dart';

class SettingListScreen extends StatefulWidget {
  const SettingListScreen({super.key});

  @override
  State<SettingListScreen> createState() => _SettingListScreenState();
}

class _SettingListScreenState extends State<SettingListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 25,
          backgroundColor: const Color.fromARGB(255, 11, 16, 54),
          title: const Text(
            "Enhance Game",
            style: TextStyle(color: Colors.white, fontFamily: "Gugi"),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 11, 16, 54),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ItelListWidget(
                  "assest/img/GraphicsOptimization.png",
                  "Graphics Optimization",
                  "Enhace Graphics",
                  GfxOptimizerApp()),
              ItelListWidget("assest/img/dpm.png", "Performance",
                  "Enhace Graphics", CloseApplication()),
              ItelListWidget("assest/img/fps.png", "FPS Monitor", "FPS Monitor",
                  FpsMonitorScreen()),
              ItelListWidget(
                  "assest/img/temperature.png",
                  "Temperature Monitoring",
                  "Temperature",
                  DeviceTempratureScreen()),
              ItelListWidget("assest/img/network.png", "Network Optimization",
                  "network Monitor", const InternetSpeedTest()),
              ItelListWidget("assest/img/ping.png", "Ping Booster (PRO)",
                  "Ping Booster", const HomePage()),
              Align(alignment: Alignment.center, child: NativeAdWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
