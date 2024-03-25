import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';

import 'core/configs/app_controller.dart';
import 'core/configs/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  AppController.production = false;
  runApp(
    const AppWidget(),
  );
}
