import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wave_avatar/wave_avatar.dart';

void main() {
  testWidgets('WaveAvatar builds successfully', (WidgetTester tester) async {
    const key = Key('wave_avatar');
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WaveAvatar(
            key: key,
            config: WaveConfig(
              waveType: WaveType.sine,
              amplitude: 10,
              frequency: 5,
            ),
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(key), findsOneWidget);
  });

  test('WaveClipper generates a path', () {
    const clipper = WaveClipper(WaveConfig());
    final path = clipper.getClip(const Size(200, 200));
    expect(path, isA<Path>());
  });
}
