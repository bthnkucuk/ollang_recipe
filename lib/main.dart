import 'package:flutter/material.dart';
import 'package:ollang_recipe/theme/material_app_updater.dart';

import 'theme/text_style.dart';
import 'theme/theme_dark.dart';
import 'theme/theme_light.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialAppUpdater(
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: navigatorKey,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: MaterialAppInheritedWidget.of(context).themeMode,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    if (WidgetsBinding.instance.window.platformBrightness == Brightness.light)
      MaterialAppInheritedWidget.of(context)
          .changeTheme(mode: ThemeMode.dark, brightness: Brightness.dark);
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        WidgetsBinding.instance.window.platformBrightness == Brightness.light);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: s14W700),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
