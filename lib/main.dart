import 'package:flutter/material.dart';
import 'package:hellooooo/screen/todolist.dart';
import 'package:hellooooo/widget/addlist.dart';
import 'package:hellooooo/screen/addlocation.dart';
import 'package:hellooooo/screen/bmi.dart';
import 'package:hellooooo/screen/homescreen.dart';
import 'package:hellooooo/screen/showweather.dart';
import 'package:hellooooo/screen/weather.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/data_list_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataListAdapter());
  await Hive.openBox<DataList>('myBox');
  runApp(const MyApp());
}

// crete a stateless widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Header(),
      // home: bmiCal(),
      // home: Todolist(),
      home: Weather_app(),
    );
  }
}
