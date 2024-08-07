import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class NativeAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FacebookNativeAd(
      placementId: "831665392007588_831665475340913",
      adType: NativeAdType.NATIVE_AD,
      width: double.infinity,
      height: 300,
      backgroundColor: Colors.white,
      titleColor: Colors.black,
      descriptionColor: Colors.black,
      buttonColor: Colors.blue,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.blue,
      listener: (result, value) {
        print("Native Ad: $result --> $value");
      },
    );
  }
}
