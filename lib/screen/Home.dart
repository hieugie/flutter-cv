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
          body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: MY_COLORS[index.getIndex()],
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 48.0, top: 64),
              child: Row(
                children: <Widget>[
                  Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://scontent.fhan5-4.fna.fbcdn.net/v/t31.0-8/27503960_1760557610671114_3367977727735130915_o.jpg?_nc_cat=104&_nc_oc=AQkteqHzcxFfno4yiBwArwK5grouEc2AYuTqMELE0pU0TsSVtfwyO-Sg5OU1zrocuV0&_nc_ht=scontent.fhan5-4.fna&oh=3be086533039b8a18e62b6868bc9936f&oe=5E837DBD")
                          )
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, top: 16, bottom: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
//                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 4, left: 0, right: 16),
                      child: Text(
                        'HI, I\'m HIEU',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 24, bottom: 4.0),
              child: Text('27 year old.', style: INTRODUCE),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 24, bottom: 4.0),
              child: Text('Working in Hanoi.', style: INTRODUCE),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 24, bottom: 4.0),
              child: Text('I love comic book, guitar, traveling...',
                  style: INTRODUCE),
            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 48, right: 24, bottom: 16.0),
//              child: Text(
//                  'My next target is continue improve my self, finding a chance to join bigger project in future, Engage in application development related to big data like Block chain, Machine learning',
//                  style: INTRODUCE),
//            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Text(
                'Experience',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                width: double.infinity,
                height: 350,
                child: Container(child: ExpItemContainer())),
          ],
        ),
      )),
    );
  }
}
