import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hieugiecv/model/ExpItem.dart';
import 'package:hieugiecv/provider/IndexProvider.dart';
import 'package:hieugiecv/screen/ExpDetail.dart';
import 'package:hieugiecv/style/TextStyle.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ExpItemContainer extends StatefulWidget {
  @override
  ExpItemContainerState createState() {
    return ExpItemContainerState();
  }
}

class ExpItemContainerState extends State<ExpItemContainer> {
  Future<List<ExpItem>> expItems;

  PageController _pageController;

  Future<List<ExpItem>> fetchPost() async {
    final response =
    await http.get('https://us-central1-hieugiecv-express.cloudfunctions.net/app/api/p/exp');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
//      return ExpItem.fromJson(json.decode(response.body));
      print(response.body);

      var list = json.decode(response.body) as List;
      List<ExpItem> itemsList = list.map((i) => ExpItem.fromJson(i)).toList();
      return itemsList;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0, viewportFraction: 0.8);
    expItems = fetchPost();
  }


  Widget _expSelector(expItem, index) {
    List<Widget> list = new List<Widget>();
    if (expItem.framework != null) {
      for (var i = 0; i < expItem.framework.length; i++) {
        list.add(frameworkIcon(expItem.framework, i));
      }
    }

    final index2 = Provider.of<IndexProvider>(context);
    return Container(
      child: AnimatedBuilder(
          animation: _pageController,
          builder: (BuildContext context, Widget widget) {
            double value = 1;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page - index;
              value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
            } else if (index2.getIndex() == index) {
              value = 1;
            } else {
              value = 0.76;
            }
            return Center(
              child: SizedBox(
                height: Curves.easeInOut.transform(value) * 320.0,
                width: Curves.easeInOut.transform(value) * 350.0,
                child: widget,
              ),
            );
          },
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: 'card${expItem.id}',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          expItem.position,
                          style: EXP_POSITION,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              expItem.fromDate,
                              style: EXP_TODATE,
                            ),
                            Text(
                              ' - ' + expItem.toDate,
                              style: EXP_TODATE,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Icon(
                                Icons.account_balance,
                                color: MY_COLORS[index],
                                size: 22,
                              ),
                            ),
                            Text(
                              expItem.companyName,
                              style: EXP_COMPANY,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Icon(
                                Icons.work,
                                color: MY_COLORS[index],
                                size: 22,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                expItem.project,
                                style: EXP_DESCRIPTION,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        overflow: Overflow.visible,
                        children: list,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget frameworkIcon(framework, index) {
    return index != 0
        ? Positioned(
            left: 22.0 * index,
            child: framework.length > index
                ? Visibility(
                    visible: framework.length > index,
                    child: Image.asset(
                        'assets/images/' + framework[index] + '.png',
                        height: 36,
                        width: 36))
                : null,
          )
        : Visibility(
            visible: framework.length > index,
            child: Image.asset('assets/images/' + framework[index] + '.png',
                height: 36, width: 36));
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    return FutureBuilder<List<ExpItem>>(
      future: expItems,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(
            onPageChanged: (index) => indexProvider.changeIndex(index),
            controller: _pageController,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExpDetail(snapshot.data[index]))),
                child: _expSelector(snapshot.data[index], index),
              );

            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );

  }
}
