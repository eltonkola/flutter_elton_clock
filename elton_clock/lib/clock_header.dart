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

    return Row(children: <Widget>[
      Container(
        child: Image.asset(getWeatherIcon(),
          fit: BoxFit.fitHeight,
          color: theme.primary,
//          colorBlendMode: BlendMode.color,
        ),
      ),
      Expanded(
          flex: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 8.0, bottom: 4.0), //EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Text(
                  '${model.location}',
                  maxLines:1,
                  style: TextStyle(
                    fontFamily: 'Saira',
                    height: 1,
                    fontSize: 32,
                    color: theme.primary,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 6.0,
                        color: theme.primaryDark,
                        offset: Offset(4.0, 6.0),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Text('${model.weatherString} / ${model.temperatureString}',
                    style: TextStyle(
                      fontFamily: 'Saira',
                      height: 1,
                      fontSize: 32,
                      color: theme.primary,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: theme.primaryDark,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    )),
                Spacer(
                  flex: 1,
                ),
                Text('min: ${model.lowString} / max: ${model.highString}',
                    style: TextStyle(
                      fontFamily: 'Saira',
                      height: 1,
                      fontSize: 16,
                      color: theme.primary,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: theme.primaryDark,
                          offset: Offset(5.0, 5.0),
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

    final hour = DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime);
    final minute = DateFormat('mm').format(dateTime);
    final amPm = DateFormat('a').format(dateTime);
    final fullDate = DateFormat('MMMM dd, yyyy').format(dateTime);

    return Column(
      children: <Widget>[
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,

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
                        blurRadius: 10.0,
                        color: theme.primaryDark,
                        offset: Offset(5.0, 5.0),
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
                        blurRadius: 10.0,
                        color: theme.primaryDark,
                        offset: Offset(5.0, 5.0),
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
                        blurRadius: 10.0,
                        color: theme.primaryDark,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('$amPm',
                      style: TextStyle(
                        fontFamily: 'Saira',
                        height: 1,
                        fontSize: 32,
                        color: theme.accentDark,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: theme.primaryDark,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ))),
            ],
          ),
        ),
        Expanded(
          flex: 30,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
              child: Image.asset(
                'assets/icons/ic_calendar.png',
                width: 16,
                alignment: Alignment.topLeft,
                height: 16,
                color: theme.primaryDark,
              ),
            ),
            Container(width: 4,),
            Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 8.0, left: 4.0),
            child: Text('$fullDate',
                        style: TextStyle(
                          fontFamily: 'Saira',
                          height: 1,
                          fontSize: 22,
                          color: theme.primaryDark,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: theme.primaryDark,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ))),

          ]),
        ),
        Spacer(
          flex: 1,
        ),
      ],
    );
  }

  String getWeatherIcon(){

    final hour = int.parse(DateFormat('HH').format(dateTime));
    String ikona = model.weatherString;
    if(ikona == 'sunny'){
      //TODO - find a better way to show night or day icon
      if(hour > 7 && hour < 19){
        ikona = 'sunny_day';
      }else{
        ikona = 'sunny_night';
      }
    }
    return 'assets/weather/$ikona.png';
  }

}
