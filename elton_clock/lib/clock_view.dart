import 'package:elton_clock/clock_header.dart';
import 'package:elton_clock/progress_time.dart';
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

    String hour = DateFormat('HH').format(dateTime);
    final minute = DateFormat('mm').format(dateTime);
    final second = DateFormat('ss').format(dateTime);

    if(hour == '00'){
      hour = '24';
    }

    return Scaffold(
        backgroundColor: theme.background,

        body: Padding(
        padding: EdgeInsets.all(15.0) ,
            child:  Column(

          children: <Widget>[
            Expanded(
              flex: 25,
              child: ClockHeaderView(this.model, this.theme, this.dateTime),
            ),

            Expanded(
              flex: 25,
              child: Row(
                children: <Widget>[
                  getLeftSide('assets/icons/ic_hours.png', 'Hours'),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 90,
                    child: ClockProgressView(int.parse(hour), 24, false, theme),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 25,
              child: Row(
                children: <Widget>[
                  getLeftSide('assets/icons/ic_minutes.png', 'Minutes'),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 90,
                    child: ClockProgressView(int.parse(minute), 60, true, theme),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 25,
              child: Row(
                children: <Widget>[
                  getLeftSide('assets/icons/ic_seconds.png', 'Seconds'),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 90,
                    child: ClockProgressView(int.parse(second), 60, true, theme),
                  )
                ],
              ),
            ),
          ],
        )
        )

        );
  }

  Widget getLeftSide(String icon, String title){
    return Expanded(
      flex: 10,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 8.0),
              child: Image.asset(icon,
                width: 14,
                alignment: Alignment.topLeft,
                height: 14,
                color: theme.primaryDark,
              ),
            ),
            Container(width: 4,),
            Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 8.0, left: 4.0),
                child: Text(title,
                    style: TextStyle(
                      fontFamily: 'Saira',
                      height: 1,
                      fontSize: 12,
                      color: theme.primaryDark,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: theme.shadow,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ))),

          ]),
    );
  }
}
