import 'package:flutter/material.dart';
import 'package:louishome/components/screens/showPetfood_screen.dart';

class DogScreen extends StatefulWidget {
  @override
  _DogScreenState createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  int selectedAgeId = 0;
  int selectedSizeId = 0;
  int selectedBCSId = 0;
  bool algBool = false;
  List<String> flavorList = [];
  List<String> algList = [];
  List<String> healthList = [];
  final List<Color> colors = [Colors.blue, Colors.red];
  var age = ['Growth', 'Adult', 'Senior'];
  var size = ['소형', '중형', '대형'];
  var bcsScore = ['날씬해요', '적당해요', '통통해요'];
  //var flavor = ['닭', '오리', '칠면조', '돼지', '소', '연어', '어류', '노블 프로틴'];
  var alg = [
    '닭',
    '오리',
    '칠면조',
    '돼지',
    '소',
    '연어',
    '어류',
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
    '잘 모르겠어요',
  ];
  var health = ['뼈/관절', '피부/피모', '소화기', '체중조절', '심장'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('강아지'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  '연령',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: age.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        width: 200,
                        height: 100,
                        color: index == selectedAgeId ? colors[0] : colors[1],
                        child: Center(
                          child: Text(
                            age[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedAgeId = index;
                          print(age[index][0]);
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  '사이즈',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: size.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 200,
                        height: 100,
                        color: index == selectedSizeId ? colors[0] : colors[1],
                        child: Center(
                          child: Text(
                            size[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSizeId = index;
                          print(size[index]);
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  '체형',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: bcsScore.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        width: 150,
                        height: 100,
                        color: index == selectedBCSId ? colors[0] : colors[1],
                        child: Center(
                          child: Text(
                            bcsScore[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedBCSId = index;
                          print(bcsScore[index]);
                        });
                      },
                    ),
                  ),
                ),
                /*
                Text(
                  '선호단백질',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: flavor.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        width: 112.5,
                        color: flavorList.contains(flavor[index])
                            ? colors[0]
                            : colors[1],
                        child: Center(
                          child: Text(
                            flavor[index].toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          flavorList.contains(flavor[index])
                              ? flavorList.remove(flavor[index])
                              : flavorList.add(flavor[index]);
                        });
                      },
                    ),
                  ),
                ),
                */
                Text(
                  '알러지 여부',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (algBool == false)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            algBool = true;
                          });
                        },
                        child: Text('Yes'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            algBool = false;
                          });
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                if (algBool)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: alg.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        child: Container(
                          width: 47.5,
                          color: algList.contains(alg[index])
                              ? colors[0]
                              : colors[1],
                          child: Center(
                            child: Text(
                              alg[index].toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
                Text(
                  '건강 개선',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: health.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        width: 112.5,
                        color: healthList.contains(health[index])
                            ? colors[0]
                            : colors[1],
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
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ShowPetfoodScreen(
                        pet: '강아지',
                        age: age[selectedAgeId][0],
                        
                        bcsScore: bcsScore[selectedBCSId],
                        
                        alg: algList,
                        health: healthList,
                      );
                    }));
                  },
                  child: Text('확인'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
