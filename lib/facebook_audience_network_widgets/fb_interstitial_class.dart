import 'package:facebook_audience_network/facebook_audience_network.dart';

void showInterstitialAd() {
  FacebookInterstitialAd.loadInterstitialAd(
    placementId: "831665392007588_831665462007581",
    listener: (result, value) {
      if (result == InterstitialAdResult.LOADED) {
        FacebookInterstitialAd.showInterstitialAd();
      }
      print("Interstitial Ad: $result --> $value");
    },
  );
}
