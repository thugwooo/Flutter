import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'showpetfood.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final _alg = [
    '닭',
    '돼지',
    "소",
    "칠면조",
    "양",
    "오리",
    "연어",
    "참치",
    "어류",
    "유제품",
    "밀",
    "계란",
    "콩",
    "옥수수",
    "쌀",
    "곡류",
    "아마",
    "효모",
    "과일"
  ];
  String _selectedAlg = '닭';

  final _flavor = ["닭", "돼지", "소", "오리", "양", "칠면조", "연어", "참치", "어류", "모르겠어요"];
  String _selectedFlavor = "닭";

  final _breed = ["말티즈", "요크셔테리어"];
  String _selectedBreed = "말티즈";

  final _size = ["초소형", "소형", "중형", "대형", "초대형"];
  String _selectedSize = "초소형";

  final _when = ["임신말기/수유기", "이유기자견", "중성화이후"];
  String _selectedWhen = "중성화이후";

  final _disease = [
    "관절",
    "피부 및 피모",
    "눈",
    "위장관",
    "심장",
    "구강",
    "분리불안진정",
    "간",
    "면역",
    "노화",
    "비뇨기",
    "신장",
    "종합 건강"
  ];
  String _selectedDisease = "관절";
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text('신규고객'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('이름은?'),
                    Container(
                      width: 300,
                      child: TextField(
                        //obscureText: true, 이건 패스워드
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: '반려동물의 이름을 입력해주세요.',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: Text('반려동물의 생년월일은?'),
                      onPressed: () {
                        Future<DateTime?> future = showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light(),
                              child: child!,
                            );
                          },
                        );
                        future.then((date) {
                          setState(() {
                            selectedDate = date!;
                          });
                        });
                      },
                    ),
                    Text(
                      '생년월일 : ${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('종'),
                    DropdownButton(
                      value: _selectedBreed,
                      items: _breed.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value.toString(),
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            _selectedBreed = value.toString();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('알러지'),
                    DropdownButton(
                      value: _selectedAlg,
                      items: _alg.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value.toString(),
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            _selectedAlg = value.toString();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('맛'),
                    DropdownButton(
                      value: _selectedFlavor,
                      items: _flavor.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value.toString(),
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            _selectedFlavor = value.toString();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('크기'),
                    DropdownButton(
                      value: _selectedSize,
                      items: _size.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value.toString(),
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            _selectedSize = value.toString();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('급여시기'),
                    DropdownButton(
                      value: _selectedWhen,
                      items: _when.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value.toString(),
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            _selectedWhen = value.toString();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('질병'),
                    DropdownButton(
                      value: _selectedDisease,
                      items: _disease.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value.toString(),
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            _selectedDisease = value.toString();
                          },
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ShowPetfood(),
                          ),
                        );
                      },
                      child: Text('완료'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
