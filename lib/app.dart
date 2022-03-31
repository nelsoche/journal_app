import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/journal_list.dart';
import 'screens/entry_info.dart';
import 'screens/entry_form.dart';

class App extends StatefulWidget {
  
  final String title;
  final SharedPreferences preferences;

  const App({Key? key, required this.title, required this.preferences}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  
  final routes = {
    JournalList.routeName: (context) => const JournalList(),
    EntryInfo.routeName: (context) => const EntryInfo(),
    EntryForm.routeName: (context) => const EntryForm()
  };

  bool get isDarkMode => widget.preferences.getBool('isDarkMode') ?? false;

  late Brightness brightnessSetting;
  
  @override
  void initState() {
    super.initState();
    brightnessSetting = isDarkMode ? Brightness.dark : Brightness.light;
  }

  void brightnessToggle() {
    setState(() {
      widget.preferences.setBool('isDarkMode', !isDarkMode);
      brightnessSetting = isDarkMode ? Brightness.dark : Brightness.light;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: brightnessSetting
      ),
      routes: routes
    );
  }
}