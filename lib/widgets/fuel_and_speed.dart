// SPDX-License-Identifier: Apache-2.0
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dashboard_app/size.dart';
import '../vehicle-signals/vss_providers.dart';

class SpeedAndFuel extends ConsumerWidget {
  SpeedAndFuel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleSpeed = ref.watch(vehicleSignalSpeedProvider);
    final vehicleFuelLevel = ref.watch(vehicleSignalFuelLevelProvider);
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: SizeConfig.fontsize * 1.6,
            percent: vehicleSpeed.speed / 300,
            lineWidth: SizeConfig.fontsize / 2,
            backgroundColor: Color.fromARGB(255, 176, 213, 195),
            progressColor: Colors.lightBlueAccent,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              vehicleSpeed.speed.toInt().toString(),
              style: SizeConfig.smallnormalfont,
            ),
            footer: Text(
              'km/h',
              style: SizeConfig.smallnormalfont2,
            ),
          ),
          CircularPercentIndicator(
            radius: SizeConfig.fontsize * 1.6,
            percent: vehicleFuelLevel.level / 100,
            lineWidth: SizeConfig.fontsize / 2,
            backgroundColor: Colors.lightBlue.shade100,
            progressColor: vehicleFuelLevel.level < 25
                ? Colors.redAccent
                : vehicleFuelLevel.level < 50
                    ? Colors.orange
                    : Colors.green,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              vehicleFuelLevel.level.toInt().toString() + ' %',
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

class Rpm extends ConsumerWidget {
  Rpm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleEngineSpeed = ref.watch(vehicleSignalEngineSpeedProvider);

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
            percent: vehicleEngineSpeed.speed > 9000
                ? 9000
                : vehicleEngineSpeed.speed / 9000,
            barRadius: Radius.circular(15),
            leading: Text(
              'RPM',
              style: SizeConfig.smallnormalfont,
            ),
            trailing: Text(
              vehicleEngineSpeed.speed.toInt().toString(),
              style: SizeConfig.smallnormalfont2,
            ),
          ),
        ],
      ),
    );
  }
}
