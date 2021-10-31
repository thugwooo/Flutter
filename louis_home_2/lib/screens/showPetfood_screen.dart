import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:louis_home_2/data/breed.dart';
import 'package:louis_home_2/data/filtering.dart';
import 'package:louis_home_2/data/petfood.dart';
import 'package:louis_home_2/data/style.dart';

class ShowPetfoodScreen extends StatefulWidget {
  var userData;
  ShowPetfoodScreen({this.userData});

  @override
  _ShowPetfoodScreenState createState() => _ShowPetfoodScreenState();
}

class _ShowPetfoodScreenState extends State<ShowPetfoodScreen> {
  var filteredPetfood;
  var birthMonth;
  var gas;
  var size;
  var selectedPetfoodId;
  @override
  void initState() {
    super.initState();
    birthMonth = calBirth();

    filteredPetfood = filteringPet(petfood, widget.userData['pet']);
    print('pet' + filteredPetfood.length.toString());
    if (widget.userData['alg'].length > 0) {
      filteredPetfood = filteringAlg(filteredPetfood, widget.userData['alg']);
      print('alg' + filteredPetfood.length.toString());
    }
    filteredPetfood =
        filteringHealth(filteredPetfood, widget.userData['health']);
    print('health' + filteredPetfood.length.toString());
    if (int.parse(widget.userData['bcs']) == 2) {
      filteredPetfood = filteringBcs(filteredPetfood);
      print('bcs' + filteredPetfood.length.toString());
    }

    if (widget.userData['pet'] == '강아지') {
      // size
      calSize();
      calDogGAS();

      filteredPetfood = filteringSize(filteredPetfood, size);
      print('size' + filteredPetfood.length.toString());

      filteredPetfood = filteringAge(filteredPetfood, gas);
      print('age' + filteredPetfood.length.toString());
    } else if (widget.userData['pet'] == '고양이') {
      calCatGAS();
      filteredPetfood = filteringAge(filteredPetfood, gas);
    }
  }

  Future<dynamic> saveuserData(url) async {
    var url2 = Uri.parse(url);
    var jsonData = json.encode(widget.userData);
    print(jsonData);
    Response response = await post(url2, body: jsonData);
  }

  dynamic calBirth() {
    var today = DateTime.now();
    var birthDate;
    var birth = DateTime.utc(
      int.parse(widget.userData['birthYear']),
      int.parse(widget.userData['birthMonth']),
      int.parse(widget.userData['birthDay']),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          explain(),
          SizedBox(height: 20),
          showPetfood(),
          SizedBox(
            height: 200,
          ),
          returnButton(),
        ],
      ),
    );
  }

  Widget returnButton() {
    return ElevatedButton(
        child: Text('첫 화면으로'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }

  Widget explain() {
    return Container(
      child: Row(
        children: [
          Text(
            widget.userData['name'],
            style: smallStyle,
          ),
          Text(
            '은/는    ',
            style: smallStyle,
          ),
          Text(widget.userData['alg'].toString(), style: smallStyle),
          Text('  에 알러지가 있고    ', style: smallStyle),
          Text(widget.userData['health'].toString(), style: smallStyle),
          Text('  질환이 있으므로    ', style: smallStyle),
        ],
      ),
    );
  }

  Widget showPetfood() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        /*
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: colors[0],
          ),
          borderRadius: BorderRadius.circular(10),
        ),*/

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filteredPetfood.length,
          itemBuilder: (context, index) => InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.28,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: selectedPetfoodId == index ? colors[0] : Colors.grey,
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
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/petfood/' +
                          filteredPetfood[index]['name'].toString() +
                          '.png',
                      height: 180,
                    ),
                    Text(filteredPetfood[index]['brand'].toString(),
                        style: TextStyle(color: Colors.grey[700])),
                    Text(
                      filteredPetfood[index]['name'].toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      filteredPetfood[index]['hash'].toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '가격',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    scrollable: true,
                    actionsPadding: EdgeInsets.only(right: 18),
                    actions: [
                      Container(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            selectedPetfoodId = index;
                            widget.userData['petfood'] =
                                filteredPetfood[index]['name'];
                            print(widget.userData);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  AlertDialog(actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    saveuserData(
                                        'http://ec2-3-23-100-115.us-east-2.compute.amazonaws.com:8000/server/saveuserData/');
                                    Navigator.pop(context);
                                  },
                                  child: Text('확인'),
                                ),
                              ]),
                            );
                          },
                          child: Text(
                            'SAVE',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(primary: Colors.grey),
                        ),
                      ),
                    ],
                    content: Builder(
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: colors[0],
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'images/petfood/' +
                                          filteredPetfood[index]['name']
                                              .toString() +
                                          '.png',
                                      height: 300,
                                    ),
                                    Text(filteredPetfood[index]['brand']
                                        .toString()),
                                    Text(filteredPetfood[index]['name']
                                        .toString()),
                                    Text('가격'),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Column(
                                  children: [
                                    Text(
                                      filteredPetfood[index]['main_eff']
                                          .toString(),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
