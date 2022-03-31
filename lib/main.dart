import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'db/database_manager.dart';

void main() async {

  const String title = 'TheatreBoxd';
  const String createSchemaPath = 'assets/schema_1.sql.txt';

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);

  String createSchema = await rootBundle.loadString(createSchemaPath);
  await DatabaseManager.initialize(createSchema);

  runApp(App(title: title, preferences: await SharedPreferences.getInstance()));
}
