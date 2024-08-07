import 'package:flutter/material.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_interstitial_class.dart';
import 'package:gfx_optimizer/utility/font_size_utils.dart';

class ItelListWidget extends StatelessWidget {
  late String logo;
  late String tittle;
  late String subtittle;
  late Widget navigator;

  ItelListWidget(this.logo, this.tittle, this.subtittle, this.navigator,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(15, 22, 95, 1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(28), // Image radius
                        child: Image.asset(logo, scale: 20, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tittle,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Gugi",
                            fontSize: getResponsiveFontSize(context, 12),
                          ),
                        ),
                        Text(
                          subtittle,
                          style: const TextStyle(
                            color: Color.fromARGB(182, 255, 255, 255),
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showInterstitialAd();
                    // Navigator.pushReplacementNamed(context, navigator);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => navigator));
                    showInterstitialAd();
                  },
                  child: Container(
                    height: 42,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(229, 28, 68, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Boost",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
