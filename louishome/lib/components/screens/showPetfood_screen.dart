import 'package:flutter/material.dart';
import 'package:louishome/components/data/breed.dart';
import 'package:louishome/components/data/filtering.dart';
import 'package:louishome/components/data/petfood.dart';

class ShowPetfoodScreen extends StatefulWidget {
  var pet;
  var age;
  var breed;
  var bcsScore;
  var alg;
  var health;
  var year;
  var month;
  var day;
  ShowPetfoodScreen({
    this.pet,
    this.age,
    this.breed,
    this.bcsScore,
    this.alg,
    this.health,
    this.year,
    this.month,
    this.day,
  });

  @override
  _ShowPetfoodScreenState createState() => _ShowPetfoodScreenState();
}

class _ShowPetfoodScreenState extends State<ShowPetfoodScreen> {
  DateTime today = DateTime.now();

  var birth;
  var filteringData;
  var birthDate;
  var birthMonth;
  var size;
  var GAS;
  @override
  void initState() {
    super.initState();
    birth = DateTime.utc(int.parse(widget.year), int.parse(widget.month),
            int.parse(widget.day))
        .toString();
    birthDate =
        int.parse(today.difference(DateTime.parse(birth)).inDays.toString());
    birthMonth = birthDate ~/ 30;
    if (widget.pet == '강아지') {
      dogfiltering();
    } else if (widget.pet == '고양이') {
      catfiltering();
    }
  }

  void catfiltering() {
    filteringData = petfood;
    calCatGAS();
    filteringData = filteringGeneral(filteringData, widget.pet);
    print(filteringData.length);
    filteringData = filteringAlg(filteringData, widget.alg);
    print(filteringData.length);
    filteringData = filteringHealth(filteringData, widget.health);
    print(filteringData.length);
    if (widget.bcsScore == 2) {
      filteringData = filteringBCS(filteringData);
    }
  }

  void dogfiltering() {
    calSize();
    calDogGAS();
    filteringData = petfood;
    filteringData = filteringGeneral(filteringData, widget.pet);
    print(filteringData.length);
    filteringData = filteringAlg(filteringData, widget.alg);
    print(filteringData.length);
    filteringData = filteringHealth(filteringData, widget.health);
    print(filteringData.length);
    filteringData = filteringAge(filteringData, GAS);
    print(filteringData.length);
    filteringData = filteringSize(filteringData, size);
    print(filteringData.length);
    if (widget.bcsScore == 2) {
      filteringData = filteringBCS(filteringData);
    }
  }

  void calSize() {
    for (var i = 0; i < dogBreed.length; i++) {
      if (dogBreed[i]['breed'] == widget.breed) {
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
        print(size);
      }
    }
  }

  void calCatGAS() {
    if (birthMonth < 12) {
      GAS = 'G';
    } else if (birthMonth < 73) {
      GAS = 'A';
    } else {
      GAS = 'S';
    }
  }

  void calDogGAS() {
    if (size == '소형' || size == '중형') {
      if (birthMonth < 12) {
        GAS = 'G';
      } else if (birthMonth < 73) {
        GAS = 'A';
      } else {
        GAS = 'S';
      }
    } else {
      if (birthMonth < 16) {
        GAS = 'G';
      } else if (birthMonth < 61) {
        GAS = 'A';
      } else {
        GAS = 'S';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 36, 79, 1),
        leading: Image.asset(
          'images/png/LOGO-WHITE.png',
          height: 100,
        ),
        title: Text("LOUIS' HOME"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Row(children: [
            SizedBox(
              width: 30,
            ),
            Image.asset(
              'images/png/LOGO-BLUE.png',
              width: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '건식',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemCount: filteringData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(0, 36, 79, 1),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Text('사진'),
                        Text(
                          filteringData[index]['brand'],
                        ),
                        Text(
                          filteringData[index]['name'],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      print(filteringData.length);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(filteringData[index]['name']),
                          content: Text(filteringData[index]['main_eff']),
                        ),
                      );
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
