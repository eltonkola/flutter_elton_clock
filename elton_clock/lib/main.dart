import 'dart:io';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'elton_clock.dart';
import 'dart:io' show Platform;

void main() {
  if (!kIsWeb) {
    if (Platform.isMacOS) {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    } else if (Platform.isWindows) {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
    } else if (Platform.isLinux) {
      debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
    }
  }

  runApp(MaterialApp(
      title: 'Elton Clock',
      theme: ThemeData(fontFamily: 'Saira'),
      home: ClockCustomizer(
        (ClockModel model) => EltonClock(model),
      )));
}
