import 'package:flutter/material.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_interstitial_class.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_native_class.dart';
import 'package:gfx_optimizer/screen/setting.dart';
import 'package:gfx_optimizer/settingscreen/gfx_apply_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color backgroundColor = Color(0xFF0B1036);
const Color cardColor = Color(0xFF0F165F);
const Color accentColor = Color(0xFFE51C44);
const Color textColor = Colors.white;

class GfxOptimizerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        cardColor: cardColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _resolution = 0.5;
  String _graphicsApi = 'OpenGL';
  double _frameRate = 30;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _resolution = (prefs.getDouble('resolution') ?? 0.5);
      _graphicsApi = (prefs.getString('graphicsApi') ?? 'OpenGL');
      _frameRate = (prefs.getDouble('frameRate') ?? 30);
    });
  }

  _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('resolution', _resolution);
    prefs.setString('graphicsApi', _graphicsApi);
    prefs.setDouble('frameRate', _frameRate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 25,
        backgroundColor: const Color.fromARGB(255, 11, 16, 54),
        title: const Text(
          "Enhance Game",
          style: TextStyle(color: Colors.white, fontFamily: "Gugi"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Resolution', style: TextStyle(color: textColor)),
            Slider(
              value: _resolution,
              min: 0.1,
              max: 1.0,
              divisions: 10,
              label: _resolution.toString(),
              activeColor: accentColor,
              onChanged: (value) {
                setState(() {
                  _resolution = value;
                });
                _saveSettings();
              },
            ),
            const SizedBox(height: 20),
            const Text('Graphics API', style: TextStyle(color: textColor)),
            DropdownButton<String>(
              value: _graphicsApi,
              dropdownColor: cardColor,
              onChanged: (String? newValue) {
                setState(() {
                  _graphicsApi = newValue!;
                });
                _saveSettings();
              },
              items: <String>['OpenGL', 'Vulkan']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: textColor)),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Frame Rate', style: TextStyle(color: textColor)),
            Slider(
              value: _frameRate,
              min: 15,
              max: 60,
              divisions: 3,
              label: _frameRate.toString(),
              activeColor: accentColor,
              onChanged: (value) {
                setState(() {
                  _frameRate = value;
                });
                _saveSettings();
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                applySettings(_resolution, _graphicsApi, _frameRate);
                showInterstitialAd();
              },
              child: const Text('Apply Settings'),
            ),
            SizedBox(
              height: 20,
            ),
            NativeAdWidget()
          ],
        ),
      ),
    );
  }
}
