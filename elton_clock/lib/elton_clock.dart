import 'dart:async';
import 'dart:ui';
import 'dart:core';
import 'package:elton_clock/clock_view.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:elton_clock/themeModel.dart';

class EltonClock extends StatefulWidget {
  const EltonClock(this.model);

  final ClockModel model;

  @override
  _EltonClockState createState() => _EltonClockState();
}

class _EltonClockState extends State<EltonClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  final ClockThemeManager themeManager =  new ClockThemeManager();

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(EltonClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(seconds: 1) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      // _timer = Timer(
      //   Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness == Brightness.light ? themeManager.light :themeManager.dark;
    return ClockView(widget.model, theme, _dateTime);
  }
}
