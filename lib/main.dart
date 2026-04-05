import 'package:flutter/material.dart';
import 'package:hungry/core/di/service_locator.dart';

import 'hungry_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  runApp(const HungryApp());
}
