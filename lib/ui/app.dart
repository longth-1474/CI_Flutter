import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:com.ci.flutter/localizations.dart';
import 'package:com.ci.flutter/route_observer.dart';
import 'package:com.ci.flutter/routes.dart';

class MyApp extends StatelessWidget {
  final _navigationKey = GlobalKey<NavigatorState>();
  final _routeObserver = MyObserver();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [_routeObserver],
      navigatorKey: _navigationKey,
      localizationsDelegates: [
        const LanguageDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: [const Locale('ja', ''), const Locale('en', '')],
      localeResolutionCallback: (locale, supportedLocales) => _localeCallback(locale, supportedLocales),
      initialRoute: Routes.initScreen(),
      routes: Routes.routes,
    );
  }

  Locale _localeCallback(Locale locale, Iterable<Locale> supportedLocales) {
    if (locale == null) {
      return supportedLocales.first;
    }
    // Check if the current device locale is supported
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
    // If the locale of the device is not supported, use the first one
    // from the list (japanese, in this case).
    return supportedLocales.first;
  }
}
