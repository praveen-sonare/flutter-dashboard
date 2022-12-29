// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final fuelProvider = StateNotifierProvider<fuel, double>(
  (ref) => fuel(),
);

class fuel extends StateNotifier<double> {
  late Timer timer;
  fuel() : super(0.2) {
    Timer.periodic(Duration(seconds: 5), (timer) {
      double num = Random().nextInt(100).toDouble();
      update(num);
    });
  }
  void update(value) {
    state = value;
  }
}
