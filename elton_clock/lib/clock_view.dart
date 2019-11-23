import 'package:elton_clock/clock_header.dart';
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

    return Scaffold(
        backgroundColor: theme.background,

        body: Padding(
        padding: EdgeInsets.all(16.0) ,
            child:  Column(

          children: <Widget>[
            Expanded(
              flex: 25,
              child: ClockHeaderView(this.model, this.theme, this.dateTime),
            ),
            Expanded(
              flex: 25,
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        )
        )

//        Center(
//          child: Column(children: <Widget>[
//              Text(
//                '$hour:$minute:$second',
//                style: TextStyle(
//                  color: theme.secondaryAccent,
//                ),
//              )
//             ])
//          )

        );
  }
}
