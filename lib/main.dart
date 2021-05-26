import 'package:flutter/material.dart';
import 'package:newsapp/size_config.dart';
import 'package:newsapp/view/homepage.dart';
import 'package:provider/provider.dart';

import 'Provider/list_provider.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<ListProvider>(create: (_) => ListProvider()),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: HomePage(),

    );
  }
}