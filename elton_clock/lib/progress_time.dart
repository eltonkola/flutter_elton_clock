import 'package:elton_clock/progress_step_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:elton_clock/themeModel.dart';

class ProgressStep {
  final int value;
  final bool isLast;
  final bool isCurrent;
  final bool isShort;
  final bool rotate;

  const ProgressStep(
      this.value, this.isLast, this.isCurrent, this.isShort, this.rotate);
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

    if (stepped) {
      steps.add(ProgressStep(0, false, value == 0, false, true));
    }

    for (int i = 1; i <= total; i++) {
      bool isShort = false;
      if (stepped) {
        isShort = !(i % 5 == 0) && stepped;
      }
      steps.add(ProgressStep(i, i == total, i == value, isShort, total > 24));
    }

    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: steps
                .map(
                  (element) => ClockProgressStepView(element, theme),
                )
                .toList(),
          ),
        ));
  }
}
