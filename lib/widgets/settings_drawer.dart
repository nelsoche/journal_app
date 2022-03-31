import 'package:flutter/material.dart';
import '../app.dart';

class SettingsDrawer extends StatelessWidget {
  
  const SettingsDrawer({ Key? key }) : super(key: key);

  bool _getIsDarkMode(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? true : false;

  void _brightnessToggle(AppState appState) => appState.brightnessToggle();

  @override
  Widget build(BuildContext context) {
    
    AppState? appState = context.findAncestorStateOfType<AppState>();
    
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const SizedBox(
            height: 120.0,
            child: DrawerHeader(
              child: Text('Settings', style: TextStyle(fontSize: 25.0)),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0)
            )
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _getIsDarkMode(context),
            onChanged: (value) => _brightnessToggle(appState!),
            secondary: const Icon(Icons.lightbulb_outline)
          )
        ]
      )
    );
  }
}