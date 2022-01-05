import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:subscribeweb/data/style.dart';
import 'package:subscribeweb/data/userListData.dart';

class infoScreen extends StatefulWidget {
  @override
  _infoScreenState createState() => _infoScreenState();
}

class _infoScreenState extends State<infoScreen> {
  bool dialogFlag = false;
  int selectedUserID = 0;
  var baseUrl = 'http://18.188.38.27:8000/userdata/delete/';
  @override
  void initState() {
    super.initState();
    print(data.length);
  }

  Future<dynamic> delUserData() async {
    var url2 = Uri.parse(baseUrl);

    Response response = await post(
      url2,
      body: {
        'userPhonenumber': data[selectedUserID]['userPhonenumber'],
      },
    );
    print(response.statusCode);
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
                      Text(data[index]['userName']),
                      Text(data[index]['petName']),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: Center(child: Text(data[index]['petfood'])),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.16,
                      child: Center(
                        child: Text(data[index]['leftDate'].toString()),
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
                        onTap: () {
                          setState(() {
                            selectedUserID = index;
                            delUserData().then((value) {
                              setState(() {
                                data = value;
                              });
                            });
                          });
                        },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('이름')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text(data[selectedUserID]['userName']),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('연락처')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text(data[selectedUserID]['userPhonenumber']),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('주소')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text(data[selectedUserID]['address']),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('반려동물 이름')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text(data[selectedUserID]['petName']),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('사료 이름')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text(data[selectedUserID]['petfood']),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('구독 신청 날짜')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text(data[selectedUserID]['registerDate']),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('구독 주기(주)')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child:
                          Text(data[selectedUserID]['periodWeek'].toString()),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('다음 배송 날짜')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text(data[selectedUserID]['deliveryDate']),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(child: Text('배송 남은 날')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Text(data[selectedUserID]['leftDate'].toString()),
                    ),
                  ),
                ],
              ),
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
