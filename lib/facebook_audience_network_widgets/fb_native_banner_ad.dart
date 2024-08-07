import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class NativeBannerAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FacebookNativeAd(
        placementId:
            "831665392007588_831677125339748", // Replace with your actual placement ID
        adType: NativeAdType.NATIVE_BANNER_AD,
        bannerAdSize: NativeBannerAdSize.HEIGHT_100,
        width: double.infinity,
        backgroundColor: Colors.blue,
        titleColor: Colors.white,
        descriptionColor: Colors.white,
        buttonColor: Colors.deepPurple,
        buttonTitleColor: Colors.white,
        buttonBorderColor: Colors.white,
        listener: (result, value) {
          switch (result) {
            case NativeAdResult.ERROR:
              print('Error: $value');
              break;
            case NativeAdResult.LOADED:
              print('Loaded');
              break;
            case NativeAdResult.CLICKED:
              print('Clicked');
              break;
            case NativeAdResult.LOGGING_IMPRESSION:
              print('Logging Impression');
              break;
            case NativeAdResult.MEDIA_DOWNLOADED:
              print('Media Downloaded');
              break;
          }
        },
      ),
    );
  }
}
