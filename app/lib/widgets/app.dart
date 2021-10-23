import 'package:flutter/material.dart';

import 'home.dart';

class NinatekaApp extends StatelessWidget {
  const NinatekaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'ninateka.pl',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      );
}
