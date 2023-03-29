import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Material App'te değişiklik yapılmak istendiği zaman mantık burada uygulanmalı
class MaterialAppUpdater extends StatefulWidget {
  final Widget child;
  const MaterialAppUpdater({super.key, required this.child});

  @override
  State<MaterialAppUpdater> createState() => MaterialAppUpdaterState();
}

class MaterialAppUpdaterState extends State<MaterialAppUpdater> {
  ThemeMode themeMode = ThemeMode.system;

  void changeTheme({required ThemeMode mode, Brightness? brightness}) {
    setState(() {
      themeMode = mode;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: brightness));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialAppInheritedWidget(
      state: this,
      themeMode: themeMode,
      child: widget.child,
    );
  }
}

///
class MaterialAppInheritedWidget extends InheritedWidget {
  final ThemeMode themeMode;
  final MaterialAppUpdaterState state;

  const MaterialAppInheritedWidget({
    super.key,
    required super.child,
    required this.state,
    required this.themeMode,
  });

  static MaterialAppUpdaterState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MaterialAppInheritedWidget>()!.state;
  }

  @override
  bool updateShouldNotify(covariant MaterialAppInheritedWidget oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
