import 'package:flutter/material.dart';
import 'package:louishome/data/breed.dart';
import 'package:louishome/data/filtering.dart';
import 'package:louishome/data/petfood.dart';
import 'package:louishome/data/style.dart';

class ShowPetfoodScreen extends StatefulWidget {
  var userData;
  ShowPetfoodScreen({this.userData});
  @override
  _ShowPetfoodScreenState createState() => _ShowPetfoodScreenState();
}

class _ShowPetfoodScreenState extends State<ShowPetfoodScreen> {
  var userData;
  var expAlg;
  var expHealth;
  var petfood;
  var dialogbool = false;
  var selectedpetfoodId;
  var size;
  var birthMonth;
  var gas;
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
  @override
  void initState() {
    super.initState();
    petfood = data;
    userData = widget.userData;
    expAlg = userData['alg'].length > 0 ? true : false;
    expHealth = userData['health'].length > 0 ? true : false;
    print(expAlg);
    print(userData);
    birthMonth = calBirth();
    petfood = filteringPet(petfood, userData['pet']);
    print('pet' + petfood.length.toString());
    if (userData['alg'].length > 0) {
      petfood = filteringAlg(petfood, userData['alg']);
      print('alg' + petfood.length.toString());
    }

    petfood = filteringHealth(petfood, userData['health']);
    if (int.parse(userData['bcs'].toString()) == 2) {
      petfood = filteringBcs(petfood);
      print('bcs' + petfood.length.toString());
    }

    if (userData['pet'] == '강아지') {
      calSize();
      calDogGAS();

      petfood = filteringSize(petfood, size);
      print('size' + petfood.length.toString());
      filteringAge(petfood, gas);
      print('age' + petfood.length.toString());
    } else if (userData['pet'] == '고양이') {
      calCatGAS();
      petfood = filteringAge(petfood, gas);
      print('age' + petfood.length.toString());
    }
  }

  dynamic calBirth() {
    var today = DateTime.now();
    var birthDate;
    var birth = DateTime.utc(
      int.parse(userData['birthYear']),
      int.parse(userData['birthMonth']),
      int.parse(userData['birthDay']),
    ).toString();
    birthDate =
        int.parse(today.difference(DateTime.parse(birth)).inDays.toString());
    return birthDate ~/ 30;
  }

  void calDogGAS() {
    if (size == '소형' || size == '중형') {
      if (birthMonth < 12) {
        gas = 'G';
      } else if (birthMonth < 73) {
        gas = 'A';
      } else {
        gas = 'S';
      }
    } else {
      if (birthMonth < 16) {
        gas = 'G';
      } else if (birthMonth < 61) {
        gas = 'A';
      } else {
        gas = 'S';
      }
    }
  }

  void calCatGAS() {
    if (birthMonth < 4) {
      gas = 'G';
    } else if (birthMonth < 12) {
      gas = 'G(3~)';
    } else if (birthMonth < 73) {
      gas = 'A';
    } else {
      gas = 'S';
    }
  }

  void calSize() {
    for (var i = 0; i < dogBreed.length; i++) {
      if (dogBreed[i]['breed'] == widget.userData['breed']) {
        size = dogBreed[i]['size'];

        if (size == '대형견(초)' || size == '대형견') {
          size = '대형';
        }
        if (size == '중형견') {
          size = '중형';
        }
        if (size == '소형견(초)' || size == '소형견') {
          size = '소형';
        }
      }
    }
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
          height: MediaQuery.of(context).size.height * 0.5,
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
          bottom: 0,
          width: MediaQuery.of(context).size.width * 0.8,
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
        )
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
                    fontSize: 19,
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
          Text(
            expAlg == true
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
