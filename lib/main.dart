import 'package:flutter/material.dart';
import 'package:http_json/json_fetch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON API Fetch',
      home: JsonFetchDemo(),
    );
  }
}