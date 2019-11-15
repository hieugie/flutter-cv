import 'package:flutter/material.dart';
import 'package:hieugiecv/model/ExpItem.dart';
import 'package:hieugiecv/style/TextStyle.dart';

class ExpDetail extends StatelessWidget {
  final ExpItem expItem;

  ExpDetail(this.expItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Hero(
          tag: 'card${expItem.id}',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                child: Text(
                  expItem.position,
                  style: EXP_POSITION,
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.only(top: 4.0),
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      expItem.fromDate,
//                      style: EXP_TODATE,
//                    ),
//                    Text(
//                      ' - ' + expItem.toDate,
//                      style: EXP_TODATE,
//                    ),
//                  ],
//                ),
//              ),
            ],
          ),
        )
      ],
    ));
  }
}
