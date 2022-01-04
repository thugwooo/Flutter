import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:subscribeweb/data/petfood.dart';
import 'package:subscribeweb/data/restApi.dart';
import 'package:subscribeweb/data/style.dart';

class subscriptionScreen extends StatefulWidget {
  @override
  _subscriptionScreenState createState() => _subscriptionScreenState();
}

class _subscriptionScreenState extends State<subscriptionScreen> {
  final _formKey = GlobalKey<FormState>();
  var userData = {};
  var baseUrl = 'http://18.188.38.27:8000/userdata/get/';
  var postData = UserProvider();
  @override
  void initState() {
    super.initState();
    userData = {
      'userName': '',
      'userPhonenumber': '',
      'petName': '',
      'periodWeek': 0,
      'address': '',
      'petfood': '',
    };
  }

  Future<dynamic> postUserData() async {
    var url2 = Uri.parse(baseUrl);

    Response response = await post(
      url2,
      body: {
        'userName': userData['userName'],
        'userPhonenumber': userData['userPhonenumber'],
        'petName': userData['petName'],
        'periodWeek': userData['periodWeek'].toString(),
        'address': userData['address'],
        'petfood': userData['petfood'],
      },
    );
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputName(),
              inputPhonenumber(),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputPetName(),
              inputPeriodWeek(),
            ],
          ),
          SizedBox(height: 20),
          inputAddress(),
          SizedBox(height: 20),
          selectPetfood(),
          SizedBox(height: 20),
          subscribeButton(),
        ],
      ),
    );
  }

  Widget inputName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('보호자 이름', style: infosmallStyle),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.2,
          child: TextFormField(
            onSaved: (value) => userData['userName'] = value,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputPhonenumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('휴대폰 번호', style: infosmallStyle),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.2,
          child: TextFormField(
            onSaved: (value) => userData['userPhonenumber'] = value,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputPetName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('반려동물 이름', style: infosmallStyle),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.2,
          child: TextFormField(
            onSaved: (value) => userData['petName'] = value,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputPeriodWeek() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('배송 기간(주)', style: infosmallStyle),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.2,
          child: DropdownSearch<dynamic>(
            mode: Mode.MENU,
            items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            onChanged: (value) {
              userData['periodWeek'] = value;
            },
          ),
        ),
      ],
    );
  }

  Widget inputAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('주소 입력', style: infosmallStyle),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextFormField(
            onSaved: (value) {
              userData['address'] = value;
              print(value);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget selectPetfood() {
    return Container(
      height: 60,
      width: 200,
      child: DropdownSearch<dynamic>(
        items: petfoodName,
        showSearchBox: true,
        showClearButton: true,
        selectedItem: '사료 선택',
        onChanged: (value) => userData['petfood'] = value,
      ),
    );
  }

  Widget subscribeButton() {
    return Container(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          _formKey.currentState!.save();
          print(userData);

          postUserData();
        },
        child: Text('구독하기'),
      ),
    );
  }
}
