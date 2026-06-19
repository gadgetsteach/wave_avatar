import '../enums/wave_type.dart';

class WaveConfig {
  const WaveConfig({
    this.waveType = WaveType.sine,
    this.amplitude = 12,
    this.frequency = 16,
    this.radiusFactor = .4,
    this.phase = 0,
    this.smoothness = 360,
  });

  final WaveType waveType;
  final double amplitude;
  final double frequency;
  final double radiusFactor;
  final double phase;
  final int smoothness;
}