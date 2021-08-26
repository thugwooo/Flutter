import 'package:flutter/material.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final _alg = [
    '닭',
    '소',
    '돼지',
  ];
  String _selectedAlg = '닭';

  final _flavor = ["닭", "소", "돼지"];
  String _selectedFlavor = "닭";

  final _breed = ["말티즈", "요크셔테리어"];
  String _selectedBreed = "말티즈";

  final _size = ["초소형", "소형", "중형", "대형", "초대형"];
  String _selectedSize = "초소형";

  final _when = ["임신말기/수유기", "이유기자견", "중성화이후"];
  String _selectedWhen = "중성화이후";

  final _disease = ["피부질환", "식이알러지"];
  String _selectedDisease = "피부질환";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      Future<DateTime?> selected = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                      );
                    },
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
                    onPressed: () {},
                    child: Text('완료'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
