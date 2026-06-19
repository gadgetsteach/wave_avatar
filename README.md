# wave_avatar

A highly customizable Flutter avatar widget clipped into beautiful animated wave shapes. Supports multiple preset wave styles like sine, flower, star, blob, audio, heartbeat, liquid, and noise.

## Features

- **Custom Wave Shapes**: Clip your avatars using standard shapes, organic blobs, heartbeats, starbursts, or audio waveforms.
- **Borders & Backgrounds**: Customize border width, border color, and background color behind clipped elements.
- **Configurable Wave Properties**: Change frequency, amplitude, phase, and smoothness dynamically.
- **Fully Responsive**: Adapts seamlessly to any parent bounds.

## Getting started

Add `wave_avatar` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  wave_avatar:
    git:
      url: https://github.com/gadgetsteach/wave_avatar.git
```

Then, import the package in your Dart code:

```dart
import 'package:wave_avatar/wave_avatar.dart';
```

## Usage

Create a simple wave-shaped avatar:

```dart
WaveAvatar(
  config: const WaveConfig(
    waveType: WaveType.liquid,
    amplitude: 8.0,
    frequency: 6.0,
  ),
  child: Image.network('https://example.com/avatar.jpg'),
)
```

Create a wave avatar with a border and custom background:

```dart
WaveAvatar(
  config: const WaveConfig(
    waveType: WaveType.blob,
    amplitude: 12.0,
    smoothness: 120,
  ),
  backgroundColor: Colors.blue.shade100,
  borderColor: Colors.blue,
  borderWidth: 3.0,
  child: Image.asset('assets/avatar.png'),
)
```

## Additional information

For bug reports, feature requests, or contributions, please visit the repository at [https://github.com/gadgetsteach/wave_avatar](https://github.com/gadgetsteach/wave_avatar).
