import 'dart:async';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:gfx_optimizer/screen/home_page.dart';
import 'package:lottie/lottie.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FacebookAudienceNetwork.init();
  runApp(const MaterialApp(
    color: Color.fromARGB(255, 11, 16, 54),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 16, 54),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
                "assest/lottieAnimation/splash_animation_lottie_file.json"),
            SizedBox(
              height: 12,
            ),
            Text(
              "Welcome And Enhance your game play",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontFamily: "Gugi", fontSize: 19),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.12,
              child: LinearProgressIndicator(
                color: const Color.fromRGBO(229, 28, 68, 1),
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ));
  }
}
