// SPDX-License-Identifier: Apache-2.0
import 'package:dashboard_app/Tire_pressure.dart';
import 'package:dashboard_app/size.dart';
import 'package:dashboard_app/widgets/child_lock.dart';
import 'package:dashboard_app/widgets/fuel_and_speed.dart';
import 'package:dashboard_app/widgets/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Kuksa-server/vehicle_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final vehicle = ref.watch(vehicleSignalProvider);

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
                        Flexible(
                          flex: 1,
                          child: weather(
                            insideTemperatue: vehicle.insideTemperature,
                            outsideTempearure: vehicle.outsideTemperature,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: SpeedAndFuel(
                              fuel: vehicle.fuelLevel, speed: vehicle.speed),
                        ),
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
                            TirePressure(
                              tname: 'Left Front',
                              tpress: vehicle.frontLeftTP,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                            Spacer(),
                            ChildLockStatus(
                                isChildLockActiveLeft:
                                    vehicle.isChildLockActiveLeft,
                                isChildLockActiveRight:
                                    vehicle.isChildLockActiveRight),
                            Spacer(),
                            TirePressure(
                              tname: 'Left Rear',
                              tpress: vehicle.rearLeftTP,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
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
                            TirePressure(
                              tname: 'Right Front',
                              tpress: vehicle.frontRightTP,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            Spacer(),
                            ChildLockStatus(
                                isChildLockActiveLeft:
                                    vehicle.isChildLockActiveLeft,
                                isChildLockActiveRight:
                                    vehicle.isChildLockActiveRight),
                            Spacer(),
                            TirePressure(
                              tname: 'Right Rear',
                              tpress: vehicle.rearRightTP,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
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
                              Text(
                                vehicle.fuelRate.toString() + ' km/Litre',
                                style: SizeConfig.smallnormalfont,
                              ),
                            ],
                          ),
                        ),
                        Flexible(flex: 1, child: Rpm(rpm: vehicle.rpm)),
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
