import 'package:flutter/material.dart';
import 'package:hieugiecv/container/ExpItemContainer.dart';
import 'package:hieugiecv/provider/IndexProvider.dart';
import 'package:hieugiecv/screen/Home.dart';
import 'package:hieugiecv/style/TextStyle.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiếu giề\'s CV',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Ballo Bhai'),
      home: ChangeNotifierProvider<IndexProvider>(
          builder: (_) => IndexProvider(0), child: Home()),
    );
  }
}
