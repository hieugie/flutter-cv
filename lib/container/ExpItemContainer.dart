import 'package:flutter/material.dart';
import 'package:hieugiecv/model/ExpItem.dart';
import 'package:hieugiecv/provider/IndexProvider.dart';
import 'package:hieugiecv/screen/ExpDetail.dart';
import 'package:hieugiecv/style/TextStyle.dart';
import 'package:provider/provider.dart';

class ExpItemContainer extends StatefulWidget {
  @override
  ExpItemContainerState createState() {
    return ExpItemContainerState();
  }
}

class ExpItemContainerState extends State<ExpItemContainer> {
  List<ExpItem> expItems;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0, viewportFraction: 0.8);
    expItems = [
      new ExpItem(
          1,
          'Project manager',
          'Softdreams.vn',
          '02/2018',
          'Now',
          'Currently, my team and i are developing an application for Credit information center of vietnam(https://cic.org.vn/) to connect debit customers and credit org together to solve the problem of black credit.\nMy first time standing in PM position, so i have many things to learn, but it\'s time to me improve myself.\nFrom the beginning of PM to now, it\'s not as hard as i thought, main reason is i have many supports from my team, from my cool boss.',
          ['angular', 'spring', 'html', 'hibernate', 'sql'],
          'Loan customer\'s infomation gateway'),
      new ExpItem(
          2,
          'Developer',
          'FSoft',
          '12/2017',
          '02/2018',
          'Currently, my team and i are developing an application for Credit information center of vietnam(https://cic.org.vn/) to connect debit customers and credit org together to solve the problem of black credit.\nMy first time standing in PM position, so i have many things to learn, but it\'s time to me improve myself.\nFrom the beginning of PM to now, it\'s not as hard as i thought, main reason is i have many supports from my team, from my cool boss.',
          ['react'],
          'HP product'),
      new ExpItem(
          3,
          'Developer',
          'Tecapro.com.vn',
          '11/2015',
          '12/2017',
          'Currently, my team and i are developing an application for Credit information center of vietnam(https://cic.org.vn/) to connect debit customers and credit org together to solve the problem of black credit.\nMy first time standing in PM position, so i have many things to learn, but it\'s time to me improve myself.\nFrom the beginning of PM to now, it\'s not as hard as i thought, main reason is i have many supports from my team, from my cool boss.',
          ['angular', 'spring', 'html', 'hibernate', 'sql'],
          'Social insurence of Vietnam')
    ];
  }


  Widget _expSelector(index) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < expItems[index].frameWork.length; i++) {
      list.add(frameworkIcon(expItems[index].frameWork, i));
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
                height: Curves.easeInOut.transform(value) * 280.0,
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
                    tag: 'card${expItems[index].id}',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          expItems[index].position,
                          style: EXP_POSITION,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              expItems[index].fromDate,
                              style: EXP_TODATE,
                            ),
                            Text(
                              ' - ' + expItems[index].toDate,
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
                              expItems[index].company,
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
                                expItems[index].project,
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
    return PageView.builder(
      onPageChanged: (index) => indexProvider.changeIndex(index),
      itemCount: expItems.length,
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExpDetail(expItems[index]))),
          child: _expSelector(index),
        );
      },
    );
  }
}
