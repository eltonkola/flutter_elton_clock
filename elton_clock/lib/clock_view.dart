
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:elton_clock/themeModel.dart';

class ClockView extends StatelessWidget {

  final ClockModel model;
  final ClockTheme theme;
  final DateTime dateTime;

  const ClockView(this.model, this.theme, this.dateTime);

  @override
  Widget build(BuildContext context) {

    final hour = DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime);
    final minute = DateFormat('mm').format(dateTime);
    final second = DateFormat('ss').format(dateTime);

 return Scaffold(
        backgroundColor: theme.primary,
        body: Center(
          child: Column(children: <Widget>[
              Text(
                '$hour:$minute:$second',
                style: TextStyle(
                  color: theme.secondaryAccent,
                ),
              )
             ])
          ));

          
  }
}
