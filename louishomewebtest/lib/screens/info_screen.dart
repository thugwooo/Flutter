import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:louishomewebtest/data/controller.dart';
import 'package:louishomewebtest/data/style.dart';

class infoScreen extends StatefulWidget {
  @override
  _infoScreenState createState() => _infoScreenState();
}

class _infoScreenState extends State<infoScreen> {
  infoController infoData = Get.put(infoController());
  bool infoFlag = false;
  int selectedIndex = 0;

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
        if (infoFlag) userInfoDialog()
      ],
    );
  }

  Widget tableInfo() {
    return Row(
      children: [
        Container(
          width: context.width * 0.16,
          height: context.height * 0.1,
          child: Center(
            child: Text(
              '이름',
              style: infosmallStyle,
            ),
          ),
        ),
        Container(
          width: context.width * 0.16,
          height: context.height * 0.1,
          child: Center(
            child: Text(
              '사료',
              style: infosmallStyle,
            ),
          ),
        ),
        Container(
          width: context.width * 0.16,
          height: context.height * 0.1,
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
      width: context.width * 0.5,
      height: context.height * 0.5,
      child: ListView.separated(
        itemCount: infoData.userList.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => InkWell(
          child: Container(
            width: context.width * 0.5,
            height: context.height * 0.1,
            child: Row(
              children: [
                Container(
                  width: context.width * 0.16,
                  height: context.height * 0.1,
                  child: Center(
                    child: Text(
                      infoData.userList[index]['userName'],
                      style: infosmallStyle,
                    ),
                  ),
                ),
                Container(
                  width: context.width * 0.16,
                  height: context.height * 0.1,
                  child: Center(
                    child: Text(
                      infoData.userList[index]['petfood'],
                      style: infosmallStyle,
                    ),
                  ),
                ),
                Container(
                  width: context.width * 0.16,
                  height: context.height * 0.5,
                  child: Center(
                    child: Text(
                      infoData.userList[index]['date'].toString(),
                      style: infosmallStyle,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      infoData.userList.removeAt(index);
                    });
                  },
                  child: Positioned(
                    right: 10,
                    top: 20,
                    child: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              selectedIndex = index;
              infoFlag = true;
            });
          },
        ),
      ),
    );
  }

  Widget userInfoDialog() {
    return InkWell(
      onTap: () {
        setState(() {
          infoFlag = false;
        });
      },
      child: Container(
        width: context.width * 0.5,
        height: context.height * 0.5,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: colors[0],
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              '회원정보',
              style: infosmallStyle,
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('이름'),
                  Text(infoData.userList[selectedIndex]['userName']),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('휴대폰 번호'),
                  Text(infoData.userList[selectedIndex]['userPhonenumber']),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('주소'),
                  Text(infoData.userList[selectedIndex]['address']),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('반려동물 이름'),
                  Text(infoData.userList[selectedIndex]['petName']),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('배송까지 남은 기간(일)'),
                  Text(infoData.userList[selectedIndex]['date'].toString() +
                      '일'),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('구독 신청 날짜'),
                  Text(infoData.userList[selectedIndex]['registerDate']
                      .toString()),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('다음 배송 날짜'),
                  Text(infoData.userList[selectedIndex]['registerDate']),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('구독 기간'),
                  Text(infoData.userList[selectedIndex]['periodWeek']
                          .toString() +
                      '주'),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('사료'),
                  Text(infoData.userList[selectedIndex]['petfood'] + '가격'),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('이전 사료'),
                  Text('리스트 형식으로'),
                ],
              ),
            ),
            Container(
              width: context.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('결제 정보'),
                  Text(infoData.userList[selectedIndex]['credit']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
