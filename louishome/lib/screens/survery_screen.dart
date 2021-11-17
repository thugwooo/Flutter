import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:louishome/data/breed.dart';
import 'package:louishome/data/style.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:louishome/data/surveyData.dart';
import 'package:louishome/screens/showpetfood_screen.dart';

class SurveyScreen extends StatefulWidget {
  var userData;
  SurveyScreen({this.userData});

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _formKey = GlobalKey<FormState>();
  var userData;
  var selectedSexId = 0;
  var selectedNeuId = 0;
  var selectedBcsId = 0;
  var selectedAlgYnId = 1;
  var algList = [];
  var healthList = [];
  var alg;
  var health;
  var data;
  var dataFlag = false;
  Future<dynamic> getPetfood(url) async {
    var url2 = Uri.parse(url);

    Response response = await post(
      url2,
      body: {
        'pet': userData['pet'],
        'breed': userData['breed'],
        'bcs': userData['bcs'].toString(),
        'birthYear': userData['birthYear'],
        'birthMonth': userData['birthMonth'],
        'birthDay': userData['birthDay'],
        'alg': userData['alg'].toString(),
        'health': userData['health'].toString(),
      },
    );
    if (response.statusCode == 200) {
      dataFlag = true;
      print('survey page성공');
      data = jsonDecode(utf8.decode(response.bodyBytes)).split(',');
      data.removeAt(0);
      print(data);
    } else {
      dataFlag = false;
      print('실패');
    }
  }

  @override
  void initState() {
    super.initState;
    userData = widget.userData;
    print(userData);
    alg = userData['pet'] == '강아지' ? dogAlg : catAlg;
    health = userData['pet'] == '강아지' ? dogHealth : catHealth;
    selectedSexId = userData['sex'];
    selectedNeuId = userData['neu'];
    selectedBcsId = userData['bcs'];
    selectedAlgYnId = userData['alg'].length > 0 ? 0 : 1;
    algList = userData['alg'];
    healthList = userData['health'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputName(),
                  inputBreed(),
                  inputBirth(),
                  Row(
                    children: [
                      inputSex(),
                      inputNeu(),
                    ],
                  ),
                  inputWeight(),
                  inputBcs(),
                  inputAlg(),
                  SizedBox(height: 20),
                  inputHealth(),
                  Center(child: submitButton()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputHealth() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '건   강   관   리',
            style: surveyBig,
          ),
          SizedBox(height: 20),
          healthBottom(),
        ],
      ),
    );
  }

  Widget healthBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: GridView.builder(
        itemCount: health.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 3.5 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: healthList.contains(health[index])
                      ? colors[0]
                      : colors[1],
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  health[index].toString(),
                  style: TextStyle(
                    color: healthList.contains(health[index])
                        ? colors[0]
                        : colors[1],
                    fontWeight:
                        healthList.contains(health[index]) ? bold[0] : bold[1],
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                healthList.contains(health[index])
                    ? healthList.remove(health[index])
                    : healthList.add(health[index]);
              });
            }),
      ),
    );
  }

  Widget inputAlg() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          algTop(),
          if (selectedAlgYnId == 0) algBottom(),
        ],
      ),
    );
  }

  Widget algBottom() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.27,
      child: GridView.builder(
        itemCount: alg.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 3.5 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: algList.contains(alg[index]) ? colors[0] : colors[1],
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  alg[index].toString(),
                  style: TextStyle(
                    color: algList.contains(alg[index]) ? colors[0] : colors[1],
                    fontWeight:
                        algList.contains(alg[index]) ? bold[0] : bold[1],
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                algList.contains(alg[index])
                    ? algList.remove(alg[index])
                    : algList.add(alg[index]);
              });
            }),
      ),
    );
  }

  Widget algTop() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        children: [
          Text(
            '알 러 지  여 부',
            style: surveyBig,
          ),
          SizedBox(width: 40),
          algynButton(0),
          SizedBox(width: 20),
          algynButton(1),
        ],
      ),
    );
  }

  Widget algynButton(var index) {
    return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: selectedAlgYnId == index ? colors[0] : colors[1],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              yn[index].toString(),
              style: TextStyle(
                fontSize: 20,
                color: selectedAlgYnId == index ? colors[0] : colors[1],
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            selectedAlgYnId = index;
          });
        });
  }

  Widget inputBcs() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '체                 형',
            style: surveyBig,
          ),
          Row(
            children: [
              bcsButton(0),
              bcsButton(1),
              bcsButton(2),
            ],
          ),
        ],
      ),
    );
  }

  Widget bcsButton(var index) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.22,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  selectedBcsId == index
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: selectedBcsId == index ? colors[0] : colors[1],
                ),
                SizedBox(width: 10),
                Text(
                  bcsText[index],
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: selectedBcsId == index ? colors[0] : colors[1],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                userData['pet'] == '강아지' ? dogBcsImg[index] : catBcsImg[index],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          selectedBcsId = index;
          userData['bcs'] = selectedBcsId;
        });
      },
    );
  }

  Widget inputWeight() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        children: [
          Text(
            '몸      무       게',
            style: surveyBig,
          ),
          SizedBox(width: 40),
          Container(
            width: MediaQuery.of(context).size.width * 0.2 + 20,
            height: MediaQuery.of(context).size.height * 0.03,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                userData['weight'] = value;
              },
            ),
          ),
          Text('    KG', style: surveyBig),
        ],
      ),
    );
  }

  Widget inputNeu() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        children: [
          Text(
            '중성화여부',
            style: surveyBig,
          ),
          SizedBox(width: 40),
          neuButton(0),
          SizedBox(width: 20),
          neuButton(1),
        ],
      ),
    );
  }

  Widget neuButton(var index) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: selectedNeuId == index ? colors[0] : colors[1],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            yn[index].toString(),
            style: TextStyle(
              fontSize: 20,
              color: selectedNeuId == index ? colors[0] : colors[1],
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedNeuId = index;
          userData['neu'] = selectedNeuId;
        });
      },
    );
  }

  Widget inputSex() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        children: [
          Text(
            '성                 별',
            style: surveyBig,
          ),
          SizedBox(width: 40),
          sexButton(0),
          SizedBox(width: 20),
          sexButton(1),
        ],
      ),
    );
  }

  Widget sexButton(var index) {
    return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: selectedSexId == index ? colors[0] : colors[1],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              sex[index].toString(),
              style: TextStyle(
                fontSize: 20,
                color: selectedSexId == index ? colors[0] : colors[1],
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            selectedSexId = index;
            userData['sex'] = selectedSexId;
          });
        });
  }

  Widget inputBirth() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        children: [
          Text(
            '생   년   월   일',
            style: surveyBig,
          ),
          SizedBox(
            width: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.04,
            child: DropdownButton(
              isExpanded: true,
              value: widget.userData['birthYear'],
              items: year.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors[1]),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  userData['birthYear'] = value.toString();
                });
              },
            ),
          ),
          Text(
            ' 년  ',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.04,
            child: DropdownButton(
              isExpanded: true,
              value: widget.userData['birthMonth'],
              items: month.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors[1]),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  userData['birthMonth'] = value.toString();
                });
              },
            ),
          ),
          Text(
            ' 월  ',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.04,
            child: DropdownButton(
              isExpanded: true,
              value: widget.userData['birthDay'],
              items: day.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors[1]),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  userData['birthDay'] = value.toString();
                });
              },
            ),
          ),
          Text(
            ' 일',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget inputName() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            userData['pet'] == '강아지' ? '반 려 견  이 름' : '반 려 묘  이 름',
            style: surveyBig,
          ),
          SizedBox(width: 40),
          Text(
            userData['name'],
            style: TextStyle(
              fontSize: 25,
              color: colors[1],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputBreed() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        children: [
          Text(
            userData['pet'] == '강아지'
                ? '견                 종'
                : '묘                 종',
            style: surveyBig,
          ),
          SizedBox(width: 40),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.04,
            child: DropdownSearch<String>(
              dropdownSearchBaseStyle: TextStyle(
                  fontFamily: 'NanumBarunGothic', fontWeight: FontWeight.w700),
              mode: Mode.MENU,
              showSelectedItems: true,
              items:
                  widget.userData['pet'] == '강아지' ? dogBreedList : catBreedList,
              showSearchBox: true,
              popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (data) => widget.userData['breed'] = data!,
              selectedItem: widget.userData['breed'],
            ),
          )
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
              '다 음',
              style: TextStyle(
                fontWeight: bold[0],
                fontSize: 20,
              ),
            ),
          ),
        ),
        onTap: () {
          _formKey.currentState!.save();
          userData['alg'] = algList;
          userData['health'] = healthList;
          getPetfood('http://3.22.236.33:8000/app1/filter/').then((value) {
            if (dataFlag) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShowPetfoodScreen(
                  userData: userData,
                  petfoodName: data,
                );
              }));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('서버 접속에 실패하였습니다.'),
              ));
            }
          });
        });
  }
}
