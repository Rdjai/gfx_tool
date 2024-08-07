import 'package:flutter/material.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_banner_class.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_native_class.dart';
import 'package:gfx_optimizer/widgets/fps_overlay.dart';

import '../screen/setting.dart';

class FpsMonitorScreen extends StatefulWidget {
  const FpsMonitorScreen({super.key});

  @override
  State<FpsMonitorScreen> createState() => _FpsMonitorScreenState();
}

class _FpsMonitorScreenState extends State<FpsMonitorScreen> {
  @override
  Widget build(BuildContext context) {
    var value = FPSOverlay();

    return Scaffold(
      appBar: AppBar(
        elevation: 25,
        backgroundColor: const Color.fromARGB(255, 11, 16, 54),
        title: const Text(
          "Fps Monitor Screen",
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
      backgroundColor: const Color.fromARGB(255, 11, 16, 54),
      body: Container(
        child: Column(
          children: [
            BannerAdWidget(),
            Card(
              color: const Color.fromRGBO(15, 22, 95, 1),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 7,
                child: Align(
                  alignment: Alignment.center,
                  child: value,
                ),
              ),
            ),
            const Text(
              "aim for 60 fps or higher to benefit from smoother and more responsive gameplay",
              style:
                  TextStyle(color: Colors.white, backgroundColor: Colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 52,
            ),
            NativeAdWidget()
          ],
        ),
      ),
    );
  }
}
