import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:louis_home_2/data/breed.dart';
import 'package:louis_home_2/data/style.dart';
import 'package:louis_home_2/data/surveyData.dart';
import 'package:louis_home_2/screens/showPetfood_screen.dart';

class SurveyScreen extends StatefulWidget {
  var userData;
  SurveyScreen({this.userData});
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _formKey = GlobalKey<FormState>();
  var algBool = false;
  var selectedAlgId = 1;
  var algList = [];
  var healthList = [];

  @override
  void initState() {
    super.initState();
    algList = widget.userData['alg'];
    healthList = widget.userData['health'];
    if (algList.length > 0) {
      algBool = true;
      selectedAlgId = 0;
      print(algBool);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: 20),
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
            SizedBox(height: 10),
            inputBcs(),
            inputAlg(),
            inputHealth(),
            if (!algBool) SizedBox(height: 160),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget inputName() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          //blueLogo,
          SizedBox(width: 10),
          Text(
            widget.userData['pet'] == '강아지' ? '반 려 견   이 름' : '반 려 묘   이 름',
            style: smallStyle,
          ),
          SizedBox(width: 40),
          SizedBox(
            width: 100,
            height: 36,
            child: Text(
              widget.userData['name'],
              style: TextStyle(
                fontFamily: 'NanumBarunGothic',
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: colors[0],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputBreed() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          //blueLogo,
          SizedBox(width: 10),
          Text(
            widget.userData['pet'] == '강아지'
                ? '견                 종'
                : '묘                 종',
            style: smallStyle,
          ),
          SizedBox(
            width: 40,
          ),
          SizedBox(
            width: 200,
            height: 40,
            child: DropdownSearch<String>(
              dropdownSearchBaseStyle: TextStyle(
                  fontFamily: 'NanumBarunGothic', fontWeight: FontWeight.bold),
              mode: Mode.MENU,
              showSelectedItems: true,
              items:
                  widget.userData['pet'] == '강아지' ? dogBreedList : catBreedList,
              showSearchBox: true,
              popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (data) => widget.userData['breed'] = data!,
              selectedItem: widget.userData['breed'],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputBirth() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          //blueLogo,
          SizedBox(width: 10),
          Text(
            '생   년   월   일',
            style: smallStyle,
          ),
          SizedBox(width: 40),
          SizedBox(
            height: 40,
            child: DropdownButton(
              menuMaxHeight: 300,
              value: widget.userData['birthYear'],
              items: year.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.userData['birthYear'] = value.toString();
                });
              },
            ),
          ),
          Text(
            '년',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
            child: DropdownButton(
              menuMaxHeight: 300,
              value: widget.userData['birthMonth'],
              items: month.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.userData['birthMonth'] = value.toString();
                });
              },
            ),
          ),
          Text(
            '월',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
            child: DropdownButton(
              menuMaxHeight: 300,
              value: widget.userData['birthDay'],
              items: day.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.userData['birthDay'] = value.toString();
                });
              },
            ),
          ),
          Text(
            '일',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget inputSex() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          //blueLogo,
          SizedBox(width: 10),
          Text('성                별', style: smallStyle),
          SizedBox(width: 30),
          Container(
            height: 80,
            width: 240,
            child: ListView.builder(
              itemCount: sex.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: index == int.parse(widget.userData['sex'])
                            ? colors[0]
                            : colors[1],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  width: 90,
                  height: 60,
                  child: Center(
                    child: Text(
                      sex[index],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.userData['sex'] = index.toString();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputNeu() {
    return Container(
      child: Row(
        children: [
          Text(
            '중성화여부',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 30),
          Container(
            height: 80,
            width: 240,
            child: ListView.builder(
              itemCount: yn.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: index == int.parse(widget.userData['neu'])
                            ? colors[0]
                            : colors[1],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  width: 90,
                  height: 60,
                  child: Center(
                    child: Text(
                      yn[index],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.userData['neu'] = index.toString();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputWeight() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          //blueLogo,
          SizedBox(
            width: 10,
          ),
          Text(
            '몸       무     게',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'NanumBarunGothic',
            ),
          ),
          SizedBox(width: 40),
          SizedBox(
            width: 150,
            height: 40,
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'NanumBarunGothic', fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.userData['weight'].toString(),
              ),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                widget.userData['weight'] = value.toString();
              },
            ),
          ),
          SizedBox(width: 10),
          Text(
            'KG',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget inputBcs() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //blueLogo,
          SizedBox(width: 10),
          Text('체                형', style: smallStyle),
          SizedBox(width: 20),
          Container(
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 650,
                  child: ListView.builder(
                    itemCount: widget.userData['pet'] == '강아지'
                        ? dogBcsImg.length
                        : catBcsImg.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: index == int.parse(widget.userData['bcs'])
                                  ? colors[0]
                                  : colors[1],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        width: 200,
                        height: 60,
                        child: Center(
                          child: Image.asset(
                            widget.userData['pet'] == '강아지'
                                ? dogBcsImg[index]
                                : catBcsImg[index],
                            width: 200,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.userData['bcs'] = index.toString();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputAlg() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              //blueLogo,
              SizedBox(
                width: 10,
              ),
              Text(
                '알 러 지 여 부',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 25),
              Container(
                height: 80,
                width: 240,
                child: ListView.builder(
                  itemCount: yn.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color:
                                index == selectedAlgId ? colors[0] : colors[1],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 60,
                      child: Center(
                        child: Text(
                          yn[index],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedAlgId = index;
                        algBool = index == 0;
                        print(algBool);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          if (algBool)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              height: 280,
              width: double.infinity,
              child: GridView.builder(
                itemCount: widget.userData['pet'] == '강아지'
                    ? dogAlg.length
                    : catAlg.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    childAspectRatio: 2 / 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) => InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: algList.contains(widget.userData['pet'] == '강아지'
                                ? dogAlg[index]
                                : catAlg[index])
                            ? colors[0]
                            : colors[1],
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        widget.userData['pet'] == '강아지'
                            ? dogAlg[index].toString()
                            : catAlg[index].toString(),
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(
                      () {
                        algList.contains(widget.userData['pet'] == '강아지'
                                ? dogAlg[index]
                                : catAlg[index])
                            ? algList.remove(widget.userData['pet'] == '강아지'
                                ? dogAlg[index]
                                : catAlg[index])
                            : algList.add(widget.userData['pet'] == '강아지'
                                ? dogAlg[index]
                                : catAlg[index]);
                        widget.userData['alg'] = algList;
                        print(widget.userData['alg']);
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget inputHealth() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              //blueLogo,
              SizedBox(width: 10),
              Text('건  강    관  리', style: smallStyle),
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            height: 150,
            child: GridView.builder(
              itemCount: widget.userData['pet'] == '강아지'
                  ? dogHealth.length
                  : catHealth.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 2 / 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) => InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: healthList.contains(widget.userData['pet'] == '강아지'
                              ? dogHealth[index]
                              : catHealth[index])
                          ? colors[0]
                          : colors[1],
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      widget.userData['pet'] == '강아지'
                          ? dogHealth[index].toString()
                          : catHealth[index].toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    print(healthList);
                    healthList.contains(widget.userData['pet'] == '강아지'
                            ? dogHealth[index]
                            : catHealth[index])
                        ? healthList.remove(widget.userData['pet'] == '강아지'
                            ? dogHealth[index]
                            : catHealth[index])
                        : healthList.add(widget.userData['pet'] == '강아지'
                            ? dogHealth[index]
                            : catHealth[index]);
                    widget.userData['health'] = healthList;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      child: ElevatedButton(
        child: Text(
          'CURATION',
          style: TextStyle(
              fontFamily: 'NanumBarunGothic', fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
        ),
        onPressed: () {
          _formKey.currentState!.save();

          print(widget.userData);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ShowPetfoodScreen(
              userData: widget.userData,
            );
          }));
        },
      ),
    );
  }
}
