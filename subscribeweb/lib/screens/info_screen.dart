import 'package:flutter/material.dart';

import 'package:subscribeweb/data/style.dart';
import 'package:subscribeweb/data/userListData.dart';

class infoScreen extends StatefulWidget {
  @override
  _infoScreenState createState() => _infoScreenState();
}

class _infoScreenState extends State<infoScreen> {
  bool dialogFlag = false;
  int selectedUserID = 0;
  @override
  void initState() {
    super.initState();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            tableInfo(),
            Divider(),
            tableList(),
          ],
        ),
        if (dialogFlag) userInfoDialog()
      ],
    );
  }

  Widget tableInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
            child: Text(
              '이름',
              style: infosmallStyle,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
            child: Text(
              '사료',
              style: infosmallStyle,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
            child: Text(
              '배송 기간',
              style: infosmallStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget tableList() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: data.length,
        itemBuilder: (context, index) => InkWell(
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data[selectedUserID]['userName']),
                      Text('반려동물 이름'),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: Center(child: Text('사료 이름')),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.16,
                      child: Center(
                        child: Text('날짜'),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: MediaQuery.of(context).size.width * 0.01,
                      child: InkWell(
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              dialogFlag = true;
              selectedUserID = index;
            });
          },
        ),
      ),
    );
  }

  Widget userInfoDialog() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              //Text('이름'),
              Text(
                data[selectedUserID]['userName'],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          dialogFlag = false;
        });
      },
    );
  }
}
