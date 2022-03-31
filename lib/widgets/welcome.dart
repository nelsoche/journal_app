import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  
  const Welcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome!', 
            style: Theme.of(context).textTheme.headline5, 
            textAlign: TextAlign.center
          ),
          const SizedBox(height: 10.0),
          Center(
            child: Image.asset(
              'assets/images/theatre_masks.png',
              semanticLabel: 'Comedy and tragedy theatre masks',
              fit: BoxFit.contain,
              height: imageSize(context)
            )
          ),
          const SizedBox(height: 10.0),
          Text(
            'How was the show?', 
            style: Theme.of(context).textTheme.headline6, 
            textAlign: TextAlign.center
          )
        ]
      )
    );
  }
}

double padding(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width * 0.05;
  } else {
    return MediaQuery.of(context).size.width * 0.25;
  }
}

double imageSize(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * 0.25;
  } else {
    return MediaQuery.of(context).size.width * 0.5;
  }
}