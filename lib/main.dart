import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/app.dart';
import 'package:rarovideowall/src/app_module.dart';

void main() => runApp(ModularApp(module: AppModule(), child: const App()));
