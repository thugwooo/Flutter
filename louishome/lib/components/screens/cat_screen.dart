import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:louishome/components/data/breed.dart';
import 'package:louishome/components/screens/showPetfood_screen.dart';

class CatScreen extends StatefulWidget {
  var userData;
  CatScreen({
    this.userData,
  });
  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var weight = "";
  var year = [];
  var month = [];
  var day = [];
  var selectedYearValue = '2021';
  var selectedMonthValue = '1';
  var selectedDayValue = '1';
  var sex = ['수컷', '암컷'];
  var selectedSexId = 0;
  var neutering = ['YES', 'NO'];
  var selectedNeuteringId = 0;
  var algAnswer = ['YES', 'NO'];
  var selectedAlgId = 1;
  var colors = [Color.fromRGBO(0, 36, 79, 1), Colors.grey];
  var breed;
  var bcsImg = [
    'images/bcs/cat_01.png',
    'images/bcs/cat_02.png',
    'images/bcs/cat_03.png'
  ];
  var selectedBCSId = 0;
  bool algBool = false;
  List<String> algList = [];
  List<String> healthList = [];
  var health = [
    '뼈/관절',
    '피부/피모',
    '소화기',
    '다이어트',
    '비뇨계/방광염 결석',
    '신장',
    '심장/당뇨',
    '헤어볼',
    '기타'
  ];
  var alg = [
    '닭',
    '오리',
    '칠면조',
    '돼지',
    '소',
    '연어',
    '어류',
    '새우',
    '갑각류',
    '양',
    '사슴',
    '멧돼지',
    '곤충',
    '콩',
    '곡류',
    '과일',
    '효모',
    '달걀',
    '유제품',
    '아마',
    '메추리',
    '갑각류',
    '토끼',
    '잘 모르겠어요',
  ];
  @override
  initState() {
    super.initState();
    for (var i = 0; i < 33; i++) {
      year.add((i + 1990).toString());
      if (i < 31) {
        day.add((i + 1).toString());
      }
      if (i < 12) {
        month.add((i + 1).toString());
      }
    }
    if (widget.userData.length > 0) {
      selectedYearValue = widget.userData['birthYear'];
      selectedMonthValue = widget.userData['birthMonth'];
      selectedDayValue = widget.userData['birthDay'];
      selectedBCSId = int.parse(widget.userData['bcs']);
      selectedSexId = int.parse(widget.userData['sex']);
      selectedNeuteringId = int.parse(widget.userData['neu']);

      algList.add(widget.userData['alg']);
      if (algList.length > 0) {
        algBool = true;
        selectedAlgId = 0;
      }
      healthList.add(widget.userData['health']);
      weight = widget.userData['weight'];
      name = widget.userData['name'];
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
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/png/LOGO-BLUE.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '반려묘  이름',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 40),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: widget.userData['name'],
                          ),
                          onSaved: (value) {
                            widget.userData['name'] = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/png/LOGO-BLUE.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '묘             종',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 40),
                      SizedBox(
                          width: 200,
                          height: 40,
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            showSelectedItems: true,
                            items: catBreedList,
                            showSearchBox: true,
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (data) => breed = data,
                            selectedItem: widget.userData['breed'],
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/png/LOGO-BLUE.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '생  년  월  일',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 40),
                      SizedBox(
                        height: 40,
                        child: DropdownButton(
                          menuMaxHeight: 300,
                          value: selectedYearValue,
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
                              selectedYearValue = value.toString();
                              widget.userData['yearBirth'] = selectedYearValue;
                            });
                          },
                        ),
                      ),
                      Text(
                        '년',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        child: DropdownButton(
                          menuMaxHeight: 300,
                          value: selectedMonthValue,
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
                              selectedMonthValue = value.toString();
                              widget.userData['yearMonth'] = selectedMonthValue;
                            });
                          },
                        ),
                      ),
                      Text(
                        '월',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        child: DropdownButton(
                          menuMaxHeight: 300,
                          value: selectedDayValue,
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
                              selectedDayValue = value.toString();
                            });
                          },
                        ),
                      ),
                      Text(
                        '일',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/png/LOGO-BLUE.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '성             별',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
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
                                    color: index == selectedSexId
                                        ? colors[0]
                                        : colors[1],
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.all(10),
                              width: 90,
                              height: 60,
                              //color: index == selectedSexId ? colors[0] : colors[1],
                              child: Center(
                                child: Text(
                                  sex[index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedSexId = index;
                                print(sex[index]);
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '중성화여부',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 30),
                      Container(
                        height: 80,
                        width: 240,
                        child: ListView.builder(
                          itemCount: neutering.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: index == selectedNeuteringId
                                        ? colors[0]
                                        : colors[1],
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.all(10),
                              width: 90,
                              height: 60,
                              child: Center(
                                child: Text(
                                  neutering[index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedNeuteringId = index;
                                print(neutering[index]);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/png/LOGO-BLUE.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '몸     무    게',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 40),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: widget.userData['weight'],
                            ),
                            onSaved: (value) {
                              widget.userData['weight'] = value;
                            }),
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
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/png/LOGO-BLUE.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '체             형',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 30),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 200,
                              width: 650,
                              child: ListView.builder(
                                itemCount: bcsImg.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: index == selectedBCSId
                                              ? colors[0]
                                              : colors[1],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: 200,
                                    height: 60,
                                    child: Center(
                                      child: Image.asset(
                                        bcsImg[index],
                                        width: 200,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedBCSId = index;
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
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/png/LOGO-BLUE.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '알러지 여부',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      if (algBool == false)
                        Container(
                          height: 80,
                          width: 240,
                          child: ListView.builder(
                            itemCount: algAnswer.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: index == selectedAlgId
                                          ? colors[0]
                                          : colors[1],
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                margin: EdgeInsets.all(10),
                                width: 100,
                                height: 60,
                                //color: index == selectedSexId ? colors[0] : colors[1],
                                child: Center(
                                  child: Text(
                                    algAnswer[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedAlgId = index;
                                  if (index == 0) {
                                    algBool = true;
                                  }
                                  print(algAnswer[index]);
                                });
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (algBool)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    height: 250,
                    width: double.infinity,
                    child: GridView.builder(
                      itemCount: alg.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          childAspectRatio: 2 / 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) => InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: algList.contains(alg[index])
                                  ? colors[0]
                                  : colors[1],
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              alg[index].toString(),
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(
                            () {
                              algList.contains(alg[index])
                                  ? algList.remove(alg[index])
                                  : algList.add(alg[index]);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                /*
                  Container(
                    width: 700,
                    height: 50,
                    decoration: BoxDecoration(
                            border: Border.all(
                              color: colors[1],
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text('잘모르겠어요.',style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                          ),
                  ),
                  */
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/png/LOGO-BLUE.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '건 강  관 리',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  height: 150,
                  child: GridView.builder(
                    itemCount: health.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        childAspectRatio: 2 / 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: healthList.contains(health[index])
                                ? colors[0]
                                : colors[1],
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            health[index].toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          healthList.contains(health[index])
                              ? healthList.remove(health[index])
                              : healthList.add(health[index]);
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('제출'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ShowPetfoodScreen(
                        userData: widget.userData,
                      );
                    }));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}