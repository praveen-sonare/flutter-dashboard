// SPDX-License-Identifier: Apache-2.0
import 'package:dashboard_app/size.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SpeedAndFuel extends StatelessWidget {
  double fuel;
  double speed;
  SpeedAndFuel({Key? key, required this.fuel, required this.speed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: SizeConfig.fontsize * 1.6,
            percent: speed / 300,
            lineWidth: SizeConfig.fontsize / 2,
            backgroundColor: Color.fromARGB(255, 176, 213, 195),
            progressColor: Colors.lightBlueAccent,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              speed.toInt().toString(),
              style: SizeConfig.smallnormalfont,
            ),
            footer: Text(
              'km/h',
              style: SizeConfig.smallnormalfont2,
            ),
          ),
          CircularPercentIndicator(
            radius: SizeConfig.fontsize * 1.6,
            percent: fuel / 100,
            lineWidth: SizeConfig.fontsize / 2,
            backgroundColor: Colors.lightBlue.shade100,
            progressColor: fuel < 25
                ? Colors.redAccent
                : fuel < 50
                    ? Colors.orange
                    : Colors.green,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              fuel.toInt().toString() + ' %',
              style: SizeConfig.smallnormalfont,
            ),
            footer: Text(
              'Fuel',
              style: SizeConfig.smallnormalfont2,
            ),
          ),
        ],
      ),
    );
  }
}

class Rpm extends StatelessWidget {
  double rpm;
  Rpm({Key? key, required this.rpm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeBlockVertical * 9,
      width: SizeConfig.safeBlockHorizontal * 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Engine",
            style: SizeConfig.smallnormalfont2,
          ),
          LinearPercentIndicator(
            backgroundColor: Colors.white70,
            addAutomaticKeepAlive: true,
            progressColor: Colors.lightBlueAccent,
            animateFromLastPercent: true,
            animation: true,
            animationDuration: 500,
            percent: rpm > 9000 ? 9000 : rpm / 9000,
            barRadius: Radius.circular(15),
            leading: Text(
              'RPM',
              style: SizeConfig.smallnormalfont,
            ),
            trailing: Text(
              rpm.toInt().toString(),
              style: SizeConfig.smallnormalfont2,
            ),
          ),
        ],
      ),
    );
  }
}
