import 'dart:ui';

class ClockTheme {
  final Color background;
  final Color primary;
  final Color primaryDark;
  final Color accent;
  final Color accentDark;
  final Color shadow;

  const ClockTheme(this.background, this.primary, this.primaryDark, this.accent,
      this.accentDark, this.shadow);
}

class ClockThemeManager {
  final ClockTheme light = new ClockTheme(
      fromHex("#FFFFFF"),
      fromHex("#8A8A8A"),
      fromHex("#757575"),
      fromHex("#C70000"),
      fromHex("#302F2F"),
      fromHex("#40000000"));

  final ClockTheme dark = new ClockTheme(
      fromHex("#3A384D"),
      fromHex("#D0D0D9"),
      fromHex("#C5C5CC"),
      fromHex("#713A91"),
      fromHex("#756B8C"),
      fromHex("#00FFFFFF"));

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
