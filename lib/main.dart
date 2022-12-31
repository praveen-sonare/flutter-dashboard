// SPDX-License-Identifier: Apache-2.0

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'vehicle-signals/intial_connection.dart';
import 'vehicle-signals/vehicle_config.dart';
import 'config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpClient client = await initializeClient();


  runApp(
    
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetConfig(client: client),
      ),
    ),
  );
}


