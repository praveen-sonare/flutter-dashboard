// SPDX-License-Identifier: Apache-2.0
import 'dart:convert';
import 'dart:io';

import 'package:dashboard_app/vehicle-signals/vss_providers.dart';
import 'package:dashboard_app/vehicle-signals/vehicle_server_path.dart';
import 'package:dashboard_app/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VISS {
  static const requestId = "test-id";
  static void init(WebSocket socket, WidgetRef ref) {
    authorize(socket, ref);
    subscribe(socket, ref, VSSPath.vehicleSpeed);
    subscribe(socket, ref, VSSPath.vehicleEngineSpeed);
    subscribe(socket, ref, VSSPath.vehicleFuelLevel);
    subscribe(socket, ref, VSSPath.vehicleFrontLeftTire);
    subscribe(socket, ref, VSSPath.vehicleFrontRightTire);
    subscribe(socket, ref, VSSPath.vehicleRearLeftTire);
    subscribe(socket, ref, VSSPath.vehicleRearRightTire);
    subscribe(socket, ref, VSSPath.vehicleIsChildLockActiveLeft);
    subscribe(socket, ref, VSSPath.vehicleIsChildLockActiveRight);
    subscribe(socket, ref, VSSPath.vehicleFuelRate);
    subscribe(socket, ref, VSSPath.vehicleInsideTemperature);
    subscribe(socket, ref, VSSPath.vehicleOutsideTemperature);
  }

  static void update(WebSocket socket, WidgetRef ref) {
    get(socket, ref, VSSPath.vehicleSpeed);
    get(socket, ref, VSSPath.vehicleEngineSpeed);
    get(socket, ref, VSSPath.vehicleFuelLevel);
    get(socket, ref, VSSPath.vehicleOutsideTemperature);
    get(socket, ref, VSSPath.vehicleFrontLeftTire);
    get(socket, ref, VSSPath.vehicleFrontRightTire);
    get(socket, ref, VSSPath.vehicleRearLeftTire);
    get(socket, ref, VSSPath.vehicleRearRightTire);
    get(socket, ref, VSSPath.vehicleIsChildLockActiveLeft);
    get(socket, ref, VSSPath.vehicleIsChildLockActiveRight);
    get(socket, ref, VSSPath.vehicleFuelRate);
    get(socket, ref, VSSPath.vehicleInsideTemperature);
  }

  static void authorize(WebSocket socket, WidgetRef ref) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "authorize",
      "tokens": config.kuksaAuthToken,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void get(WebSocket socket, WidgetRef ref, String path) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "get",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void set(WebSocket socket, WidgetRef ref, String path, String value) {
    final config = ref.read(ConfigStateprovider);
    Map<String, dynamic> map = {
      "action": "set",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId,
      "value": value
    };
    socket.add(jsonEncode(map));
  }

  static void subscribe(WebSocket socket, WidgetRef ref, String path) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "subscribe",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void parseData(WidgetRef ref, String data) {
    Map<String, dynamic> dataMap = jsonDecode(data);
    if (dataMap["action"] == "subscription" || dataMap["action"] == "get") {
      if (dataMap.containsKey("data")) {
        if ((dataMap["data"] as Map<String, dynamic>).containsKey("dp") &&
            (dataMap["data"] as Map<String, dynamic>).containsKey("path")) {
          String path = dataMap["data"]["path"];
          Map<String, dynamic> dp = dataMap["data"]["dp"];
          if (dp.containsKey("value")) {
            if (dp["value"] != "---") {
              switch (path) {
                case VSSPath.vehicleSpeed:
                  ref
                      .read(vehicleSignalSpeedProvider.notifier)
                      .update(speed: dp["value"]);
                  break;
                case VSSPath.vehicleEngineSpeed:
                  ref
                      .read(vehicleSignalEngineSpeedProvider.notifier)
                      .update(speed: dp["value"].toDouble());
                  break;
                case VSSPath.vehicleFuelLevel:
                  ref
                      .read(vehicleSignalFuelLevelProvider.notifier)
                      .update(level: dp["value"]);
                  break;
                case VSSPath.vehicleFuelRate:
                  ref
                      .read(vehicleSignalFuelRateProvider.notifier)
                      .update(rate: dp["value"]);
                  break;
                case VSSPath.vehicleFrontLeftTire:
                  ref
                      .read(vehicleSignalFrontLeftTirePressureProvider.notifier)
                      .update(pressure: dp["value"]);
                  break;
                case VSSPath.vehicleFrontRightTire:
                  ref
                      .read(
                          vehicleSignalFrontRightTirePressureProvider.notifier)
                      .update(pressure: dp["value"]);
                  break;
                case VSSPath.vehicleRearLeftTire:
                  ref
                      .read(vehicleSignalRearLeftTirePressureProvider.notifier)
                      .update(pressure: dp["value"]);
                  break;
                case VSSPath.vehicleRearRightTire:
                  ref
                      .read(vehicleSignalRearRightTirePressureProvider.notifier)
                      .update(pressure: dp["value"]);
                  break;
                case VSSPath.vehicleIsChildLockActiveLeft:
                  ref
                      .read(vehicleSignalLeftChildLockActiveProvider.notifier)
                      .update(engaged: dp["value"]);
                  break;
                case VSSPath.vehicleIsChildLockActiveRight:
                  ref
                      .read(vehicleSignalRightChildLockActiveProvider.notifier)
                      .update(engaged: dp["value"]);
                  break;
                case VSSPath.vehicleInsideTemperature:
                  ref
                      .read(vehicleSignalInsideTempProvider.notifier)
                      .update(temp: dp["value"]);
                  break;
                case VSSPath.vehicleOutsideTemperature:
                  ref
                      .read(vehicleSignalOutsideTempProvider.notifier)
                      .update(temp: dp["value"]);
                  break;
                default:
                  print("$path Not Available yet!");
              }
            } else {
              print("ERROR:Value not available yet! Set Value of $path");
            }
          } else {
            print("ERROR:'value': Key not found!");
          }
        } else if ((!dataMap["data"] as Map<String, dynamic>)
            .containsKey("path")) {
          print("ERROR:'path':key not found !");
        } else if ((dataMap["data"] as Map<String, dynamic>)
            .containsKey("dp")) {
          print("ERROR:'dp':key not found !");
        }
      } else {
        print("ERROR:'data':key not found!");
      }
    }
  }
}
