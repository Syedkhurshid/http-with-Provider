import 'package:flutter/material.dart';
import 'package:http_provider/Models/news_data.dart';
import 'package:http_provider/Pages/Provider.dart';

import 'package:provider/provider.dart';

import 'Pages/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Rest',
      theme: ThemeData(

        primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: ChangeNotifierProvider(
        create: (context) => Newsdata(),
        builder: (context,child){
          return Storypage();
        }
      )
    );
  }
}

