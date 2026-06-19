import 'dart:math';

import 'package:flutter/material.dart';

import '../enums/wave_type.dart';
import '../models/wave_config.dart';

class WaveClipper extends CustomClipper<Path> {
  const WaveClipper(this.config);

  final WaveConfig config;

  @override
  Path getClip(Size size) {
    final path = Path();

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final radius =
        min(size.width, size.height) * config.radiusFactor;

    for (int i = 0; i <= config.smoothness; i++) {
      final angle = (i / config.smoothness) * 360;
      final rad = angle * pi / 180;

      final wave = radius + _wave(rad);

      final x = centerX + wave * cos(rad);
      final y = centerY + wave * sin(rad);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  double _wave(double rad) {
    switch (config.waveType) {
      case WaveType.sine:
        return config.amplitude *
            sin(rad * config.frequency + config.phase);

      case WaveType.flower:
        return config.amplitude *
            sin(rad * config.frequency);

      case WaveType.star:
        return config.amplitude *
            cos(rad * config.frequency);

      case WaveType.blob:
        return config.amplitude *
            (sin(rad * 3 + config.phase) +
                cos(rad * 5 + config.phase) * .5);

      case WaveType.audio:
        return config.amplitude *
            (sin(rad * config.frequency + config.phase) * 0.5 +
                sin(rad * (config.frequency * 2.5) + config.phase * 2.0) * 0.3 +
                cos(rad * (config.frequency * 0.2) + config.phase * 0.5) * 0.2);

      case WaveType.heartbeat:
        final base = sin(rad * config.frequency + config.phase);
        return config.amplitude *
            (pow(base, 9).toDouble() +
                0.2 * sin(rad * config.frequency * 3 + config.phase));

      case WaveType.liquid:
        return config.amplitude *
            (sin(rad * config.frequency + config.phase) * 0.6 +
                sin(rad * (config.frequency * 0.5) + config.phase * 1.5) * 0.4);

      case WaveType.noise:
        return config.amplitude *
            (sin(rad * config.frequency + config.phase) * 0.7 +
                sin(rad * (config.frequency * 4.5) + config.phase * 2.1) * 0.25 +
                sin(rad * (config.frequency * 12.0)) * 0.05);
    }
  }

  @override
  bool shouldReclip(
    covariant WaveClipper oldClipper,
  ) {
    return oldClipper.config != config;
  }
}