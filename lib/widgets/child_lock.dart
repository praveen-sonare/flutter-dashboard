// SPDX-License-Identifier: Apache-2.0
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dashboard_app/size.dart';
import '../vehicle-signals/vss_providers.dart';

class ChildLockStatus extends ConsumerWidget {
  ChildLockStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleLeftChildLockActive =
        ref.watch(vehicleSignalLeftChildLockActiveProvider);
    final vehicleRightChildLockActive =
        ref.watch(vehicleSignalRightChildLockActiveProvider);

    return vehicleLeftChildLockActive.engaged &&
            vehicleRightChildLockActive.engaged
        ? Column(
            children: [
              Text(
                "Child Lock",
                style: TextStyle(
                    fontSize: SizeConfig.fontsize / 3, color: Colors.green),
              ),
              Text(
                "Activated",
                style: TextStyle(
                    fontSize: SizeConfig.fontsize / 3, color: Colors.green),
              ),
              SizedBox(
                width: SizeConfig.safeBlockVertical / 2,
              ),
              Icon(
                Icons.lock,
                size: SizeConfig.fontsize / 3,
                color: Colors.green,
              ),
            ],
          )
        : Column(
            children: [
              Text(
                'No child  Lock',
                style: TextStyle(
                  fontSize: SizeConfig.fontsize / 2,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical / 2,
              ),
              Icon(
                Icons.lock_open_outlined,
                size: SizeConfig.fontsize / 4,
                color: Colors.red,
              ),
            ],
          );
  }
}
