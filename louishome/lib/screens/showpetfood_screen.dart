import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:louishome/data/petfood.dart';
import 'package:louishome/data/style.dart';

class ShowPetfoodScreen extends StatefulWidget {
  var userData;
  var petfoodName;
  ShowPetfoodScreen({this.userData, this.petfoodName});
  @override
  _ShowPetfoodScreenState createState() => _ShowPetfoodScreenState();
}

class _ShowPetfoodScreenState extends State<ShowPetfoodScreen> {
  var userData;
  var expAlg;
  var expHealth;
  var petfood = [];
  var dialogbool = false;
  var selectedpetfoodId;
  var size;
  var birthMonth;
  var gas;
  var subData;

  var showpetfoodStyle = [
    TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    TextStyle(fontSize: 5),
  ];
  Future<dynamic> postUserData(url) async {
    var url2 = Uri.parse(url);
    Response response = await post(
      url2,
      body: {
        'name': userData['name'].toString(),
        'phoneNumber': userData['phoneNumber'].toString(),
        'pet': userData['pet'].toString(),
        'breed': userData['breed'].toString(),
        'birthYear': userData['birthYear'].toString(),
        'birthMonth': userData['birthMonth'].toString(),
        'birthDay': userData['birthDay'].toString(),
        'sex': userData['sex'].toString(),
        'neu': userData['neu'].toString(),
        'weight': userData['weight'],
        'bcs': userData['bcs'].toString(),
        'alg': userData['alg'].toString(),
        'health': userData['health'].toString(),
        'petfood': petfood[selectedpetfoodId]['name'].toString(),
      },
    );
    if (response.statusCode == 200) {
      print('petfood page성공');
    } else {
      print('실패');
    }
  }

  @override
  void initState() {
    super.initState();
    print(data.length);
    userData = widget.userData;
    print(userData);
    for (var i = 0; i < widget.petfoodName.length; i++) {
      for (var j = 0; j < data.length; j++) {
        if (widget.petfoodName[i] == data[j]['name']) {
          petfood.add(data[j]);
        }
      }
    }
    if (userData['alg'].contains('잘 모르겠어요')) {
      expAlg = 0;
    } else if (!userData['alg'].contains('잘 모르겠어요') &&
        userData['alg'].length > 0) {
      expAlg = 1;
    } else {
      expAlg = 2;
    }
    expHealth = userData['health'].length > 0 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              explain(),
              showPetfood(),
              submitButton(),
            ],
          ),
          if (dialogbool)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1 - 25,
              left: MediaQuery.of(context).size.width * 0.1 - 25,
              child: dialog(),
            ),
        ],
      ),
    );
  }

  Widget dialog() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(25),
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 2),
                blurRadius: 1,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-2, -2),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              leftDialog(),
              rightDialog(),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            child: Icon(
              Icons.cancel,
              size: 50,
            ),
            onTap: () {
              setState(() {
                dialogbool = false;
              });
            },
          ),
        ),
        Positioned(
          bottom: 0,
          right: MediaQuery.of(context).size.width * 0.35,
          child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: colors[0],
                ),
                height: 50,
                width: 100,
                child: Center(
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: bold[0],
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Text(
                        '저장하시겠습니까?',
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            postUserData(
                                'http://3.22.236.33:8000/app1/sign-in/');
                          },
                          child: Text(
                            '확인',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '취소',
                          ),
                        )
                      ],
                    ),
                  );
                });
                //여기에 저장 버튼 넣기
              }),
        ),
      ],
    );
  }

  Widget leftDialog() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/petfood/' +
                petfood[selectedpetfoodId]['name'].toString() +
                '.png',
            height: 300,
          ),
          Text(
            petfood[selectedpetfoodId]['brand'].toString(),
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            petfood[selectedpetfoodId]['name'].toString(),
            style: TextStyle(
              fontSize:
                  petfood[selectedpetfoodId]['name'].toString().length > 11
                      ? 17
                      : 19,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            petfood[selectedpetfoodId]['price'].toString() +
                ' 원 / ' +
                petfood[selectedpetfoodId]['volume'].toString(),
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget rightDialog() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0;
              i < petfood[selectedpetfoodId]['main_eff'].length;
              i++)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (i % 3 == 0)
                  Image.asset(
                    'images/png/check_box.png',
                    height: 30,
                  ),
                if (i % 3 == 0)
                  Text(
                    '\na',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                Text('\n', style: TextStyle(fontSize: 13)),
                Expanded(
                  child: Text(
                    petfood[selectedpetfoodId]['main_eff'][i].toString(),
                    softWrap: true,
                    style: showpetfoodStyle[i % 3],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget showPetfood() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: petfood.length,
        itemBuilder: (context, index) => InkWell(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.28,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0, 0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Image.asset(
                  'images/petfood/' +
                      petfood[index]['name'].toString() +
                      '.png',
                  height: 180,
                ),
                SizedBox(height: 5),
                Text(
                  petfood[index]['brand'].toString(),
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  petfood[index]['name'].toString(),
                  style: TextStyle(
                    fontSize:
                        petfood[index]['name'].toString().length > 11 ? 17 : 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  petfood[index]['price'].toString() +
                      ' 원 / ' +
                      petfood[index]['volume'].toString(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  petfood[index]['hash'].toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              selectedpetfoodId = index;
              dialogbool = true;
            });
          },
        ),
      ),
    );
  }

  Widget explain() {
    return Container(
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (expAlg == 0)
            Text(
              '알레르기를 잘 모르고',
              style: surveyBig,
              softWrap: true,
            ),
          Text(
            expAlg == 1
                ? userData['alg'].toString() + '에 알레르기가 있고'
                : '알레르기가 없고',
            style: surveyBig,
            softWrap: true,
          ),
          Text(
            expHealth == true
                ? userData['health'].toString() + '건강에 관심이 있는'
                : '별도의 건강 관리가 필요하지 않은',
            style: surveyBig,
            softWrap: true,
          ),
          Text(
            userData['name'].toString() + '에게 아래의 상품을 추천합니다.',
            style: surveyBig,
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04,
          ),
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: line,
          child: Center(
            child: Text(
              '처음으로',
              style: TextStyle(
                fontWeight: bold[0],
                fontSize: 20,
              ),
            ),
          ),
        ),
        onTap: () {
          userData = data;
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }
}
