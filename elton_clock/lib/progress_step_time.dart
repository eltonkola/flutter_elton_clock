import 'package:elton_clock/progress_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:elton_clock/themeModel.dart';

class ClockProgressStepView extends StatelessWidget {
  final ProgressStep step;
  final ClockTheme theme;

  const ClockProgressStepView(this.step, this.theme);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 50,
            child: getLine(),
          ),
          Expanded(
            flex: 20,
            child: getNumber(),
          ),
          Expanded(
            flex: 20,
            child: getIndicator(),
          ),
        ],
      ),
    );
  }

  Widget getLine() {
    Color color = theme.primaryDark;
    double height = 30;
    double bottomPadding = 4;
    if (step.isCurrent) {
      color = theme.accent;
    }
    if (step.isShort) {
      height = 20;
      bottomPadding = 20;
    }

    return Container(
      color: color,
      width: 4,
      height: height,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(bottom: bottomPadding),
    );
  }

  Widget getNumber() {
    if (!step.isShort) {
      Color color = theme.primaryDark;
      if (step.isCurrent) {
        color = theme.accent;
      }

      int rotation = 0;
      if(step.rotate){
        rotation = 1;
      }

      String label = step.value.toString();
//      if(step.value == 60){
//        label = '-';
//      }

      return RotatedBox(
        quarterTurns: rotation,
        child:  Text(label,
//          maxLines: 1,
          style: TextStyle(
            fontFamily: 'Saira',
            height: 1,
            fontSize: 12,
            color: color ,
            fontWeight: FontWeight.w600,
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: theme.shadow,
              offset: Offset(0.0, 4.0),
            ),
          ],
          )),
      );
    }else {
      return Container(
        color: theme.background,
        width: 10,
        height: 10,
      );
    }
    }

  Widget getIndicator() {
    if (step.isCurrent) {
      return Image.asset(
        'assets/icons/ic_now.png',
        width: 16,
//        alignment: Alignment.topLeft,
        height: 16,
        color: theme.accent,
      );
    } else {
      return Container(
        color: theme.background,
        width: 16,
        height: 16,
      );
    }
  }
}
