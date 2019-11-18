import 'package:flutter/material.dart';
import 'package:hieugiecv/provider/IndexProvider.dart';
import 'package:hieugiecv/screen/Home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiếu giề\'s CV',
      theme: ThemeData(
          primaryColor: Color(0xff9c27b0),
          primaryColorLight: Color(0xffd05ce3),
          primaryColorDark: Color(0xff6a0080),
          fontFamily: 'Roboto'),
      home: ChangeNotifierProvider<IndexProvider>(
          builder: (_) => IndexProvider(0), child: Home()),
    );
  }
}
