import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/scheduler.dart';

class FPSOverlay extends StatefulWidget {
  @override
  _FPSOverlayState createState() => _FPSOverlayState();
}

class _FPSOverlayState extends State<FPSOverlay>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  int _frames = 0;
  int _lastFrameTimeStamp = 0;
  double _fps = 0;

  @override
  void initState() {
    super.initState();
    _ticker = this.createTicker(_onTick);
    _ticker.start();
  }

  void _onTick(Duration duration) {
    final int currentTimeStamp = duration.inMilliseconds;
    if (_lastFrameTimeStamp > 0) {
      _frames++;
      final int elapsedTime = currentTimeStamp - _lastFrameTimeStamp;
      if (elapsedTime >= 1000) {
        setState(() {
          _fps = (_frames * 1000 / elapsedTime);
          _frames = 0;
          _lastFrameTimeStamp = currentTimeStamp;
        });
      }
    } else {
      _lastFrameTimeStamp = currentTimeStamp;
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FPSPainter(_fps),
    );
  }
}

class _FPSPainter extends CustomPainter {
  final double fps;

  _FPSPainter(this.fps);

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(
      text: 'FPS: ${fps.toStringAsFixed(1)}',
      style: TextStyle(
        color: Colors.white,
        fontSize: 23,

        // backgroundColor: Colors.black.withOpacity(0.7),
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: ui.TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(-50, -10));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
