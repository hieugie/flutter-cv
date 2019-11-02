import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hieugiecv/container/ExpItemContainer.dart';
import 'package:hieugiecv/provider/IndexProvider.dart';
import 'package:hieugiecv/style/TextStyle.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Provider.of<IndexProvider>(context);
    return SafeArea(
      child: Scaffold(
//            backgroundColor: MY_COLORS[index.getIndex()],
          body: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            color: MY_COLORS[index.getIndex()],
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'HI, I\'m HIEU',
                    style: TextStyle(color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Baloo Bhai'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 4.0),
                  child: Text(
                      'I am currently living and working in Ha noi.',
                      style: INTRODUCE),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 4.0),
                  child: Text(
                      'My hobby is read comic book, play guitar, traveling with co-worker, friend ....',
                      style: INTRODUCE),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 16.0),
                  child: Text(
                      'My next target is continue improve my self, finding a chance to join bigger project in future, Engage in application development related to big data like Block chain, Machine learning',
                      style: INTRODUCE),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 4.0),
                  child: Text(
                      'Experience',
                      style: INTRODUCE),
                ),
                Container(
                    width: double.infinity,
                    height: 312,
                    child: Container(child: ExpItemContainer())),
              ],
            ),
          )
      ),
    );
  }
}
