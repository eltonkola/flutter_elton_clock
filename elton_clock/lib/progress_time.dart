import 'package:elton_clock/progress_step_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:elton_clock/themeModel.dart';

class ProgressStep {

  final int value;
  final bool isLast;
  final bool isCurrent;
  final bool isShort;

  const ProgressStep(this.value, this.isLast, this.isCurrent, this.isShort);

}

class ClockProgressView extends StatelessWidget {
  final int value;
  final int total;
  final bool stepped;
  final ClockTheme theme;

  const ClockProgressView(this.value, this.total, this.stepped, this.theme);

  @override
  Widget build(BuildContext context) {
    List<ProgressStep> steps = new List();
    for(int i = 1; i <= total; i++){
      bool isShort = false;
      if(stepped) {
        isShort = !(i % 5 == 0) && stepped;
      }
      steps.add(ProgressStep(i, i == total, i ==value, isShort));
    }

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children:  steps.map(
              (element) => ClockProgressStepView(element, theme),
        ).toList(),

      ),
    );
  }
}
