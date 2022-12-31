// SPDX-License-Identifier: Apache-2.0
import 'package:dashboard_app/Tire_pressure.dart';
import 'package:dashboard_app/size.dart';
import 'package:dashboard_app/widgets/child_lock.dart';
import 'package:dashboard_app/widgets/fuel_and_speed.dart';
import 'package:dashboard_app/widgets/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'vehicle-signals/vss_providers.dart';

class FuelRateText extends ConsumerWidget {
  final TextStyle style;

  FuelRateText({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleFuelRate = ref.watch(vehicleSignalFuelRateProvider);

    return Text(
      vehicleFuelRate.rate.toString() + ' km/Litre',
      style: style,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.safeBlockHorizontal * 3,
                  SizeConfig.safeBlockVertical * 3,
                  SizeConfig.safeBlockHorizontal * 3,
                  SizeConfig.safeBlockVertical),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.safeBlockVertical),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [],
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(flex: 1, child: Weather()),
                        Flexible(flex: 2, child: SpeedAndFuel()),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 11,
                    child: Container(
                      //color: Colors.red,
                      child: Row(children: [
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(height: SizeConfig.safeBlockVertical * 6),
                            FrontLeftTirePressure(),
                            Spacer(),
                            ChildLockStatus(),
                            Spacer(),
                            RearLeftTirePressure(),
                            Container(
                                height: SizeConfig.safeBlockVertical * 10),
                          ],
                        ),
                        Image.asset(
                          'images/car_img.png',
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(height: SizeConfig.safeBlockVertical * 6),
                            FrontRightTirePressure(),
                            Spacer(),
                            ChildLockStatus(),
                            Spacer(),
                            RearRightTirePressure(),
                            Container(
                                height: SizeConfig.safeBlockVertical * 10),
                          ],
                        ),
                        Spacer(),
                      ]),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fuel Consumption',
                                style: SizeConfig.smallnormalfont2,
                              ),
                              FuelRateText(style: SizeConfig.smallnormalfont),
                            ],
                          ),
                        ),
                        Flexible(flex: 1, child: Rpm()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
