import 'package:flutter/material.dart';
import 'package:test2/showFood.dart';

import 'data/network.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final List<Color> colors = [Colors.blue, Colors.red];
  var age = ['퍼피', '어덜트', '시니어'];
  List<String> ageList = [];
  var flavor = ['돼지', '소', '닭', '연어', '양', '오리', '칠면조'];
  List<String> flavorList = [];
  var alg = [
    '닭',
    '돼지',
    '소',
    '칠면조',
    '양',
    '오리',
    '연어',
    '참치',
    '어류',
    '유제품',
    '계란',
    '밀',
    '콩',
    '옥수수',
    '쌀',
    '곡류',
    '아마',
    '효모',
    '과일'
  ];
  List<String> algList = [];
  var size = ['소형', '중형', '대형'];
  List<String> sizeList = [];
  var health = ['눈물', '피부(피모)', '관절', '소화', '기호성', '알레르기'];
  List<String> healthList = [];

  void sendData(dynamic sendData) async {
    Network network = Network('https://dj-fl.herokuapp.com/app1/findFeed');
    await network.postJsonData(sendData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '이거슨!!!',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                '연령',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 100, // ListView를 쓰려면 높이를 지정해줘야 함
                child: ListView(
                  scrollDirection: Axis.horizontal, // 슬라이드 방향을 가로로 설정
                  children: [
                    Wrap(
                      direction: Axis.horizontal, // 버튼이 세로로 정렬돼야 가로 슬라이드 화면에 적합
                      children: [
                        for (var i = 0; i < age.length; i++)
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ageList.contains(age[i])
                                      ? ageList.remove(age[i])
                                      : ageList.add(age[i]);
                                });
                              },
                              child: Text(
                                age[i],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: ageList.contains(age[i])
                                      ? Colors.green
                                      : Colors.grey),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '기호 단백질',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 100, // ListView를 쓰려면 높이를 지정해줘야 함
                child: ListView(
                  scrollDirection: Axis.horizontal, // 슬라이드 방향을 가로로 설정
                  children: [
                    Wrap(
                      direction: Axis.horizontal, // 버튼이 세로로 정렬돼야 가로 슬라이드 화면에 적합
                      children: [
                        for (var i = 0; i < flavor.length; i++)
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  flavorList.contains(flavor[i])
                                      ? flavorList.remove(flavor[i])
                                      : flavorList.add(flavor[i]);
                                });
                              },
                              child: Text(
                                flavor[i],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: flavorList.contains(flavor[i])
                                      ? Colors.green
                                      : Colors.grey),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '알레르기',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 100, // ListView를 쓰려면 높이를 지정해줘야 함
                child: ListView(
                  semanticChildCount: 10,
                  scrollDirection: Axis.horizontal, // 슬라이드 방향을 가로로 설정
                  children: [
                    Wrap(
                      direction: Axis.horizontal, // 버튼이 세로로 정렬돼야 가로 슬라이드 화면에 적합
                      children: [
                        for (var i = 0; i < alg.length; i++)
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  algList.contains(alg[i])
                                      ? algList.remove(alg[i])
                                      : algList.add(alg[i]);
                                });
                              },
                              child: Text(
                                alg[i],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: algList.contains(alg[i])
                                      ? Colors.green
                                      : Colors.grey),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '사이즈',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 100, // ListView를 쓰려면 높이를 지정해줘야 함
                child: ListView(
                  scrollDirection: Axis.horizontal, // 슬라이드 방향을 가로로 설정
                  children: [
                    Wrap(
                      direction: Axis.horizontal, // 버튼이 세로로 정렬돼야 가로 슬라이드 화면에 적합
                      children: [
                        for (var i = 0; i < size.length; i++)
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  sizeList.contains(size[i])
                                      ? sizeList.remove(size[i])
                                      : sizeList.add(size[i]);
                                });
                              },
                              child: Text(
                                size[i],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: sizeList.contains(size[i])
                                      ? Colors.green
                                      : Colors.grey),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '건강 고려사항',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 100, // ListView를 쓰려면 높이를 지정해줘야 함
                child: ListView(
                  scrollDirection: Axis.horizontal, // 슬라이드 방향을 가로로 설정
                  children: [
                    Wrap(
                      direction: Axis.horizontal, // 버튼이 세로로 정렬돼야 가로 슬라이드 화면에 적합
                      children: [
                        for (var i = 0; i < health.length; i++)
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  healthList.contains(health[i])
                                      ? healthList.remove(health[i])
                                      : healthList.add(health[i]);
                                });
                              },
                              child: Text(
                                health[i],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: healthList.contains(health[i])
                                      ? Colors.green
                                      : Colors.grey),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  var data = "{'flavor': $flavorList" +
                      "'alg': $algList" +
                      "'health': $healthList}";
                  print(data);
                  sendData({
                    'flavor': flavorList.toString(),
                    'alg': algList.toString(),
                    'health': healthList.toString(),
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShowPetfood(data: sizeList);
                  }));
                },
                child: Text('완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
