// SPDX-License-Identifier: Apache-2.0
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dashboard_app/size.dart';
import '../vehicle-signals/vss_providers.dart';

class TirePressure extends StatelessWidget {
  String tireName;
  double tirePressure;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;

  TirePressure(
      {Key? key,
      required this.tireName,
      required this.tirePressure,
      required this.crossAxisAlignment,
      required this.mainAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeBlockVertical * 12,
      width: SizeConfig.safeBlockHorizontal * 14,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            '${tireName}',
            style: SizeConfig.smallnormalfont2,
          ),
          Text(
            tirePressure.toString() + ' PSI',
            style: SizeConfig.smallnormalfont,
          ),
          LinearPercentIndicator(
            width: SizeConfig.safeBlockHorizontal * 11,
            progressColor: tirePressure / 50 > 0.6 ? Colors.green : Colors.red,
            lineHeight: SizeConfig.safeBlockVertical * 1.5,
            alignment: MainAxisAlignment.center,
            animateFromLastPercent: true,
            animation: true,
            percent: tirePressure / 50,
            barRadius: Radius.circular(SizeConfig.fontsize / 4),
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class FrontLeftTirePressure extends ConsumerWidget {
  FrontLeftTirePressure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleFrontLeftTP =
        ref.watch(vehicleSignalFrontLeftTirePressureProvider);

    return TirePressure(
      tireName: 'Left Front',
      tirePressure: vehicleFrontLeftTP.pressure,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
    );
  }
}

class RearLeftTirePressure extends ConsumerWidget {
  RearLeftTirePressure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleRearLeftTP =
        ref.watch(vehicleSignalRearLeftTirePressureProvider);

    return TirePressure(
      tireName: 'Left Rear',
      tirePressure: vehicleRearLeftTP.pressure,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
    );
  }
}

class FrontRightTirePressure extends ConsumerWidget {
  FrontRightTirePressure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleFrontRightTP =
        ref.watch(vehicleSignalFrontRightTirePressureProvider);

    return TirePressure(
      tireName: 'Right Front',
      tirePressure: vehicleFrontRightTP.pressure,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

class RearRightTirePressure extends ConsumerWidget {
  RearRightTirePressure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleRearRightTP =
        ref.watch(vehicleSignalRearRightTirePressureProvider);

    return TirePressure(
      tireName: 'Right Rear',
      tirePressure: vehicleRearRightTP.pressure,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
