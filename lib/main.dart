import 'package:flutter/material.dart';
import 'package:com.ci.flutter/utils/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.ci.flutter/blocs/blocs.dart';

import 'ui/app.dart';

void main() async {
  setupLocator();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}
