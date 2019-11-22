
import 'dart:ui';

class ClockTheme {

  final Color primary;
  final Color secondary;
  final Color primaryAccent;
  final Color secondaryAccent;

  const ClockTheme(this.primary, this.secondary, this.primaryAccent, this.secondaryAccent);

}

class ClockThemeManager {

  final ClockTheme light = new ClockTheme(fromHex("#757575"), fromHex("#8A8A8A"), fromHex("#C70000"), fromHex("#302F2F"));
  final ClockTheme dark = new ClockTheme(fromHex("#756B8C"), fromHex("#D0D0D9"), fromHex("#713A91"), fromHex("#3A384D"));

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}




