// SPDX-License-Identifier: Apache-2.0
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dashboard_app/size.dart';
import '../vehicle-signals/vss_providers.dart';

class Weather extends ConsumerWidget {
  Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleInsideTemp = ref.watch(vehicleSignalInsideTempProvider);
    final vehicleOutsideTemp = ref.watch(vehicleSignalOutsideTempProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockVertical * 2),
      ),
      height: SizeConfig.safeBlockVertical * 20,
      width: SizeConfig.blockSizeHorizontal * 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: Row(children: [
                Text(
                  'Temperature',
                  style: SizeConfig.smallnormalfont,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 2,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                  width: SizeConfig.blockSizeHorizontal * 5,
                  child: Image.asset(
                    'images/thermostate.png',
                    color: Colors.orangeAccent,
                  ),
                )
              ])),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockVertical,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Inside', style: SizeConfig.smallnormalfont2),
                        Text(
                            vehicleInsideTemp.temp.toInt().toString() +
                                '\u00B0',
                            style: SizeConfig.normalfont),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Outside',
                          style: SizeConfig.smallnormalfont2,
                        ),
                        Text(
                          vehicleOutsideTemp.temp.toInt().toString() +
                              '\u00B0',
                          style: SizeConfig.normalfont,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
