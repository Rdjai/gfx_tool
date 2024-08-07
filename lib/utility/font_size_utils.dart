import 'package:flutter/material.dart';

double getResponsiveFontSize(BuildContext context, double baseFontSize) {
  double deviceWidth = MediaQuery.of(context).size.width;
  // You can adjust the scaling factor as needed
  double scalingFactor = deviceWidth /
      375.0; // Assuming 375 is the base width (e.g., iPhone 8 width)
  return baseFontSize * scalingFactor;
}
