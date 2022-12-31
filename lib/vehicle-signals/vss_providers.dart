// SPDX-License-Identifier: Apache-2.0
//import 'dart:ffi';
//import 'dart:io';
import 'package:meta/meta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Vehicle Speed

@immutable
class VehicleSignalSpeed {
  const VehicleSignalSpeed({required this.speed});

  final double speed;

  VehicleSignalSpeed copyWith({double? speed}) {
    return VehicleSignalSpeed(speed: speed ?? this.speed);
  }
}

class VehicleSignalSpeedNotifier extends StateNotifier<VehicleSignalSpeed> {
  VehicleSignalSpeedNotifier() : super(_initialValue);

  static final VehicleSignalSpeed _initialValue = VehicleSignalSpeed(speed: 60);

  void update({double? speed}) {
    state = state.copyWith(speed: speed);
  }
}

final vehicleSignalSpeedProvider =
    StateNotifierProvider<VehicleSignalSpeedNotifier, VehicleSignalSpeed>(
  (ref) => VehicleSignalSpeedNotifier(),
);

// Engine Speed

@immutable
class VehicleSignalEngineSpeed {
  const VehicleSignalEngineSpeed({required this.speed});

  final double speed;

  VehicleSignalEngineSpeed copyWith({double? speed}) {
    return VehicleSignalEngineSpeed(speed: speed ?? this.speed);
  }
}

class VehicleSignalEngineSpeedNotifier
    extends StateNotifier<VehicleSignalEngineSpeed> {
  VehicleSignalEngineSpeedNotifier() : super(_initialValue);

  static final VehicleSignalEngineSpeed _initialValue =
      VehicleSignalEngineSpeed(speed: 2000);

  void update({double? speed}) {
    state = state.copyWith(speed: speed);
  }
}

final vehicleSignalEngineSpeedProvider = StateNotifierProvider<
    VehicleSignalEngineSpeedNotifier, VehicleSignalEngineSpeed>(
  (ref) => VehicleSignalEngineSpeedNotifier(),
);

// Fuel Level

@immutable
class VehicleSignalFuelLevel {
  const VehicleSignalFuelLevel({required this.level});

  final double level;

  VehicleSignalFuelLevel copyWith({double? level}) {
    return VehicleSignalFuelLevel(level: level ?? this.level);
  }
}

class VehicleSignalFuelLevelNotifier
    extends StateNotifier<VehicleSignalFuelLevel> {
  VehicleSignalFuelLevelNotifier() : super(_initialValue);

  static final VehicleSignalFuelLevel _initialValue =
      VehicleSignalFuelLevel(level: 90);

  void update({double? level}) {
    state = state.copyWith(level: level);
  }
}

final vehicleSignalFuelLevelProvider = StateNotifierProvider<
    VehicleSignalFuelLevelNotifier, VehicleSignalFuelLevel>(
  (ref) => VehicleSignalFuelLevelNotifier(),
);

// Fuel Rate

@immutable
class VehicleSignalFuelRate {
  const VehicleSignalFuelRate({required this.rate});

  final double rate;

  VehicleSignalFuelRate copyWith({double? rate}) {
    return VehicleSignalFuelRate(rate: rate ?? this.rate);
  }
}

class VehicleSignalFuelRateNotifier
    extends StateNotifier<VehicleSignalFuelRate> {
  VehicleSignalFuelRateNotifier() : super(_initialValue);

  static final VehicleSignalFuelRate _initialValue =
      VehicleSignalFuelRate(rate: 21);

  void update({double? rate}) {
    state = state.copyWith(rate: rate);
  }
}

final vehicleSignalFuelRateProvider =
    StateNotifierProvider<VehicleSignalFuelRateNotifier, VehicleSignalFuelRate>(
  (ref) => VehicleSignalFuelRateNotifier(),
);

// Front Left Tire Pressure

@immutable
class VehicleSignalFrontLeftTirePressure {
  const VehicleSignalFrontLeftTirePressure({required this.pressure});

  final double pressure;

  VehicleSignalFrontLeftTirePressure copyWith({double? pressure}) {
    return VehicleSignalFrontLeftTirePressure(
        pressure: pressure ?? this.pressure);
  }
}

class VehicleSignalFrontLeftTirePressureNotifier
    extends StateNotifier<VehicleSignalFrontLeftTirePressure> {
  VehicleSignalFrontLeftTirePressureNotifier() : super(_initialValue);

  static final VehicleSignalFrontLeftTirePressure _initialValue =
      VehicleSignalFrontLeftTirePressure(pressure: 32);

  void update({double? pressure}) {
    state = state.copyWith(pressure: pressure);
  }
}

final vehicleSignalFrontLeftTirePressureProvider = StateNotifierProvider<
    VehicleSignalFrontLeftTirePressureNotifier,
    VehicleSignalFrontLeftTirePressure>(
  (ref) => VehicleSignalFrontLeftTirePressureNotifier(),
);

// Front Right Tire Pressure

@immutable
class VehicleSignalFrontRightTirePressure {
  const VehicleSignalFrontRightTirePressure({required this.pressure});

  final double pressure;

  VehicleSignalFrontRightTirePressure copyWith({double? pressure}) {
    return VehicleSignalFrontRightTirePressure(
        pressure: pressure ?? this.pressure);
  }
}

class VehicleSignalFrontRightTirePressureNotifier
    extends StateNotifier<VehicleSignalFrontRightTirePressure> {
  VehicleSignalFrontRightTirePressureNotifier() : super(_initialValue);

  static final VehicleSignalFrontRightTirePressure _initialValue =
      VehicleSignalFrontRightTirePressure(pressure: 32);

  void update({double? pressure}) {
    state = state.copyWith(pressure: pressure);
  }
}

final vehicleSignalFrontRightTirePressureProvider = StateNotifierProvider<
    VehicleSignalFrontRightTirePressureNotifier,
    VehicleSignalFrontRightTirePressure>(
  (ref) => VehicleSignalFrontRightTirePressureNotifier(),
);

// Rear Left Tire Pressure

@immutable
class VehicleSignalRearLeftTirePressure {
  const VehicleSignalRearLeftTirePressure({required this.pressure});

  final double pressure;

  VehicleSignalRearLeftTirePressure copyWith({double? pressure}) {
    return VehicleSignalRearLeftTirePressure(
        pressure: pressure ?? this.pressure);
  }
}

class VehicleSignalRearLeftTirePressureNotifier
    extends StateNotifier<VehicleSignalRearLeftTirePressure> {
  VehicleSignalRearLeftTirePressureNotifier() : super(_initialValue);

  static final VehicleSignalRearLeftTirePressure _initialValue =
      VehicleSignalRearLeftTirePressure(pressure: 33);

  void update({double? pressure}) {
    state = state.copyWith(pressure: pressure);
  }
}

final vehicleSignalRearLeftTirePressureProvider = StateNotifierProvider<
    VehicleSignalRearLeftTirePressureNotifier,
    VehicleSignalRearLeftTirePressure>(
  (ref) => VehicleSignalRearLeftTirePressureNotifier(),
);

// Rear Right Tire Pressure

@immutable
class VehicleSignalRearRightTirePressure {
  const VehicleSignalRearRightTirePressure({required this.pressure});

  final double pressure;

  VehicleSignalRearRightTirePressure copyWith({double? pressure}) {
    return VehicleSignalRearRightTirePressure(
        pressure: pressure ?? this.pressure);
  }
}

class VehicleSignalRearRightTirePressureNotifier
    extends StateNotifier<VehicleSignalRearRightTirePressure> {
  VehicleSignalRearRightTirePressureNotifier() : super(_initialValue);

  static final VehicleSignalRearRightTirePressure _initialValue =
      VehicleSignalRearRightTirePressure(pressure: 34);

  void update({double? pressure}) {
    state = state.copyWith(pressure: pressure);
  }
}

final vehicleSignalRearRightTirePressureProvider = StateNotifierProvider<
    VehicleSignalRearRightTirePressureNotifier,
    VehicleSignalRearRightTirePressure>(
  (ref) => VehicleSignalRearRightTirePressureNotifier(),
);

// Left Child Lock Active

@immutable
class VehicleSignalLeftChildLockActive {
  const VehicleSignalLeftChildLockActive({required this.engaged});

  final bool engaged;

  VehicleSignalLeftChildLockActive copyWith({bool? engaged}) {
    return VehicleSignalLeftChildLockActive(engaged: engaged ?? this.engaged);
  }
}

class VehicleSignalLeftChildLockActiveNotifier
    extends StateNotifier<VehicleSignalLeftChildLockActive> {
  VehicleSignalLeftChildLockActiveNotifier() : super(_initialValue);

  static final VehicleSignalLeftChildLockActive _initialValue =
      VehicleSignalLeftChildLockActive(engaged: true);

  void update({bool? engaged}) {
    state = state.copyWith(engaged: engaged);
  }
}

final vehicleSignalLeftChildLockActiveProvider = StateNotifierProvider<
    VehicleSignalLeftChildLockActiveNotifier, VehicleSignalLeftChildLockActive>(
  (ref) => VehicleSignalLeftChildLockActiveNotifier(),
);

// Right Child Lock Active

@immutable
class VehicleSignalRightChildLockActive {
  const VehicleSignalRightChildLockActive({required this.engaged});

  final bool engaged;

  VehicleSignalRightChildLockActive copyWith({bool? engaged}) {
    return VehicleSignalRightChildLockActive(engaged: engaged ?? this.engaged);
  }
}

class VehicleSignalRightChildLockActiveNotifier
    extends StateNotifier<VehicleSignalRightChildLockActive> {
  VehicleSignalRightChildLockActiveNotifier() : super(_initialValue);

  static final VehicleSignalRightChildLockActive _initialValue =
      VehicleSignalRightChildLockActive(engaged: true);

  void update({bool? engaged}) {
    state = state.copyWith(engaged: engaged);
  }
}

final vehicleSignalRightChildLockActiveProvider = StateNotifierProvider<
    VehicleSignalRightChildLockActiveNotifier,
    VehicleSignalRightChildLockActive>(
  (ref) => VehicleSignalRightChildLockActiveNotifier(),
);

// Battery Charging

@immutable
class VehicleSignalBatteryCharging {
  const VehicleSignalBatteryCharging({required this.charging});

  final bool charging;

  VehicleSignalBatteryCharging copyWith({bool? charging}) {
    return VehicleSignalBatteryCharging(charging: charging ?? this.charging);
  }
}

class VehicleSignalBatteryChargingNotifier
    extends StateNotifier<VehicleSignalBatteryCharging> {
  VehicleSignalBatteryChargingNotifier() : super(_initialValue);

  static final VehicleSignalBatteryCharging _initialValue =
      VehicleSignalBatteryCharging(charging: true);

  void update({bool? charging}) {
    state = state.copyWith(charging: charging);
  }
}

final vehicleSignalBatteryChargingProvider = StateNotifierProvider<
    VehicleSignalBatteryChargingNotifier, VehicleSignalBatteryCharging>(
  (ref) => VehicleSignalBatteryChargingNotifier(),
);

// Inside Temperature

@immutable
class VehicleSignalInsideTemp {
  const VehicleSignalInsideTemp({required this.temp});

  final double temp;

  VehicleSignalInsideTemp copyWith({double? temp}) {
    return VehicleSignalInsideTemp(temp: temp ?? this.temp);
  }
}

class VehicleSignalInsideTempNotifier
    extends StateNotifier<VehicleSignalInsideTemp> {
  VehicleSignalInsideTempNotifier() : super(_initialValue);

  static final VehicleSignalInsideTemp _initialValue =
      VehicleSignalInsideTemp(temp: 25);

  void update({double? temp}) {
    state = state.copyWith(temp: temp);
  }
}

final vehicleSignalInsideTempProvider = StateNotifierProvider<
    VehicleSignalInsideTempNotifier, VehicleSignalInsideTemp>(
  (ref) => VehicleSignalInsideTempNotifier(),
);

// Outside Temperature

@immutable
class VehicleSignalOutsideTemp {
  const VehicleSignalOutsideTemp({required this.temp});

  final double temp;

  VehicleSignalOutsideTemp copyWith({double? temp}) {
    return VehicleSignalOutsideTemp(temp: temp ?? this.temp);
  }
}

class VehicleSignalOutsideTempNotifier
    extends StateNotifier<VehicleSignalOutsideTemp> {
  VehicleSignalOutsideTempNotifier() : super(_initialValue);

  static final VehicleSignalOutsideTemp _initialValue =
      VehicleSignalOutsideTemp(temp: 32);

  void update({double? temp}) {
    state = state.copyWith(temp: temp);
  }
}

final vehicleSignalOutsideTempProvider = StateNotifierProvider<
    VehicleSignalOutsideTempNotifier, VehicleSignalOutsideTemp>(
  (ref) => VehicleSignalOutsideTempNotifier(),
);
