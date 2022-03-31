import 'package:flutter/material.dart';
import '../widgets/settings_drawer.dart';
import '../widgets/review_form.dart';

class EntryForm extends StatelessWidget {
  
  static const routeName = 'entryForm';
  
  const EntryForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('New Show Review'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip
            ),
          )
        ]
      ),
      endDrawer: const SettingsDrawer(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const ReviewForm()
        )
      )
    );
  }
}