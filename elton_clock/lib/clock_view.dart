
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
      body: Container(
        padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
          Text(
              '$hour:$minute:$second',
              style: TextStyle(
                color: theme.primary,
              ),
            )

          ]),
      ),
    );
  }
}


/*

  return  Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Lezhe, Albania',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
);






/*
@override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final fontSize = MediaQuery.of(context).size.width / 3.5;
    final offset = -fontSize / 7;
    final defaultStyle = TextStyle(
      color: colors[_Element.text],
      fontFamily: 'PressStart2P',
      fontSize: fontSize,
      shadows: [
        Shadow(
          blurRadius: 0,
          color: colors[_Element.shadow],
          offset: Offset(10, 0),
        ),
      ],
    );

    return Container(
      color: colors[_Element.background],
      child: Center(
        child: DefaultTextStyle(
          style: defaultStyle,
          child: Stack(
            children: <Widget>[
              Positioned(left: offset, top: 0, child: Text(hour)),
              Positioned(right: offset, bottom: offset, child: Text(minute)),
            ],
          ),
        ),
      ),
    );
 */

 */