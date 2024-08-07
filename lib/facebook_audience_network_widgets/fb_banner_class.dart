import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class BannerAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.5, 1),
      child: FacebookBannerAd(
        placementId: "831665392007588_831665478674246",
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          switch (result) {
            case BannerAdResult.ERROR:
              print('Error: $value');
              break;
            case BannerAdResult.LOADED:
              print('Loaded');
              break;
            case BannerAdResult.CLICKED:
              print('Clicked');
              break;
            case BannerAdResult.LOGGING_IMPRESSION:
              print('Logging Impression');
              break;
          }
        },
      ),
    );
  }
}
