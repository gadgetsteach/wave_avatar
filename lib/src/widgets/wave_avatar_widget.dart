import 'package:flutter/material.dart';

import '../clippers/wave_clipper.dart';
import '../models/wave_config.dart';

/// A custom avatar widget that clips its child into a wave shape.
class WaveAvatar extends StatelessWidget {
  const WaveAvatar({
    super.key,
    required this.child,
    this.config = const WaveConfig(),
    this.backgroundColor,
    this.borderWidth = 0.0,
    this.borderColor,
    this.padding = EdgeInsets.zero,
  });

  /// The child widget to be clipped (typically an Image or a Widget).
  final Widget child;

  /// The configuration for the wave shape.
  final WaveConfig config;

  /// The background color behind the clipped child.
  final Color? backgroundColor;

  /// The width of the border around the wave avatar.
  final double borderWidth;

  /// The color of the border around the wave avatar.
  final Color? borderColor;

  /// The padding around the avatar.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    Widget avatar = ClipPath(
      clipper: WaveClipper(config),
      child: child,
    );

    if (backgroundColor != null) {
      avatar = CustomPaint(
        painter: _WaveBackgroundPainter(
          config: config,
          color: backgroundColor!,
        ),
        child: avatar,
      );
    }

    if (borderWidth > 0 && borderColor != null) {
      avatar = CustomPaint(
        foregroundPainter: _WaveBorderPainter(
          config: config,
          borderColor: borderColor!,
          borderWidth: borderWidth,
        ),
        child: avatar,
      );
    }

    return Padding(
      padding: padding,
      child: avatar,
    );
  }
}

class _WaveBackgroundPainter extends CustomPainter {
  const _WaveBackgroundPainter({
    required this.config,
    required this.color,
  });

  final WaveConfig config;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final clipper = WaveClipper(config);
    final path = clipper.getClip(size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WaveBackgroundPainter oldDelegate) {
    return oldDelegate.config != config || oldDelegate.color != color;
  }
}

class _WaveBorderPainter extends CustomPainter {
  const _WaveBorderPainter({
    required this.config,
    required this.borderColor,
    required this.borderWidth,
  });

  final WaveConfig config;
  final Color borderColor;
  final double borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final clipper = WaveClipper(config);
    final path = clipper.getClip(size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WaveBorderPainter oldDelegate) {
    return oldDelegate.config != config ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth;
  }
}