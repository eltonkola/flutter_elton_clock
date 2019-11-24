import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:elton_clock/themeModel.dart';

class ClockHeaderView extends StatelessWidget {
  final ClockModel model;
  final ClockTheme theme;
  final DateTime dateTime;

  const ClockHeaderView(this.model, this.theme, this.dateTime);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 82,
            height: 82,
            child: Image.asset(
              getWeatherIcon(),
              fit: BoxFit.fill,
              color: theme.primaryDark,
            ),
          ),
          Expanded(
              flex: 60,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 16.0, bottom: 4.0), //EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      '${model.location}',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Saira',
                        height: 1,
                        fontSize: 38,
                        color: theme.primaryDark,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4.0,
                            color: theme.shadow,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    // - !${model.lowString} / !${model.highString}
                    Text('${model.weatherString} - ${model.temperatureString}',
                        style: TextStyle(
                          fontFamily: 'Saira',
                          height: 1,
                          fontSize: 32,
                          color: theme.primaryDark,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 4.0,
                              color: theme.shadow,
                              offset: Offset(0.0, 4.0),
                            ),
                          ],
                        )),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 40,
            child: getRightSide(),
          ),
        ]);
  }

  Widget getRightSide() {
    final hour =
        DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime);
    final minute = DateFormat('mm').format(dateTime);
    final amPm = DateFormat('a').format(dateTime);
    final fullDate = DateFormat('MMMM dd, yyyy').format(dateTime);

    return Column(
      children: <Widget>[
        Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$hour',
                style: TextStyle(
                  fontFamily: 'Saira',
                  height: 1,
                  fontSize: 64,
                  color: theme.accent,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: theme.shadow,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                )),
            Text(':',
                style: TextStyle(
                  fontFamily: 'Saira',
                  height: 1,
                  fontSize: 64,
                  color: theme.accentDark,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: theme.shadow,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                )),
            Text('$minute',
                style: TextStyle(
                  fontFamily: 'Saira',
                  height: 1,
                  fontSize: 64,
                  color: theme.accent,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: theme.shadow,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                )),
            Container(
                alignment: Alignment.topLeft,
//                  margin: const EdgeInsets.only(top: 10.0),

                child: Text('$amPm',
                    style: TextStyle(
                      fontFamily: 'Saira',
                      height: 1,
                      fontSize: 32,
                      color: theme.accentDark,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: theme.shadow,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ))),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/icons/ic_calendar.png',
                  width: 16,
                  alignment: Alignment.topLeft,
                  height: 16,
                  color: theme.primary,
                ),
              ),
              Container(
                width: 4,
              ),
              Container(
                  alignment: Alignment.topLeft,
//            margin: const EdgeInsets.only(top: 8.0, left: 4.0),
                  child: Text('$fullDate',
                      style: TextStyle(
                        fontFamily: 'Saira',
                        height: 1,
                        fontSize: 22,
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
        Spacer(
          flex: 1,
        ),
      ],
    );
  }

  String getWeatherIcon() {
    final hour = int.parse(DateFormat('HH').format(dateTime));
    String icon = model.weatherString;
    if (icon == 'sunny') {
      //TODO - find a better way to show night or day icon
      if (hour > 7 && hour < 19) {
        icon = 'sunny_day';
      } else {
        icon = 'sunny_night';
      }
    }
    return 'assets/weather/$icon.png';
  }
}
