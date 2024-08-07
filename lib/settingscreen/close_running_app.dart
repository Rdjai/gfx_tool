import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_interstitial_class.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_native_banner_ad.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_native_class.dart';
import 'package:gfx_optimizer/screen/setting.dart';

const Color backgroundColor = Color(0xFF0B1036);
const Color cardColor = Color(0xFF0F165F);
const Color accentColor = Color(0xFFE51C44);
const Color textColor = Colors.white;

class CloseApplication extends StatefulWidget {
  @override
  _CloseApplicationState createState() => _CloseApplicationState();
}

class _CloseApplicationState extends State<CloseApplication> {
  static const platform = MethodChannel('com.example.gfx_optimizer/close_apps');

  Future<void> _closeBackgroundApps() async {
    try {
      final result = await platform.invokeMethod('closeBackgroundApps');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to close apps: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GFX Optimizer',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: cardColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => const SettingListScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NativeBannerAdWidget(),
            SizedBox(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(229, 28, 68, 1),
              ),
              onPressed: () {
                _closeBackgroundApps;
                showInterstitialAd();
              },
              child: const Text(
                'Close Background Apps',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NativeAdWidget()
          ],
        ),
      ),
    );
  }
}
