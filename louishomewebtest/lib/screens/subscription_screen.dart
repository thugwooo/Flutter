import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:louishomewebtest/data/controller.dart';
import 'package:louishomewebtest/data/petfood.dart';
import 'package:louishomewebtest/data/style.dart';

class subscriptionScreen extends StatefulWidget {
  @override
  _subscriptionScreenState createState() => _subscriptionScreenState();
}

class _subscriptionScreenState extends State<subscriptionScreen> {
  final _formKey = GlobalKey<FormState>();

  userDataController userData = Get.put(userDataController());
  infoController infoData = Get.put(infoController());
  var petfoodData;
  var credit = ['일괄결제', '분할결제', '카드', '계좌이체', '현금'];
  @override
  void initState() {
    super.initState();
    petfoodData = petfoodName;
    print(petfoodData);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectPetfood(),
                  selectCredit(),
                ],
              ),
              SizedBox(height: 20),
              subscribeButton(),
            ],
          ),
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
          width: Get.width * 0.2,
          child: TextFormField(
            onSaved: (value) => userData.userName.value = value.toString(),
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
          width: Get.width * 0.2,
          child: TextFormField(
            onSaved: (value) =>
                userData.userPhonenumber.value = value.toString(),
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
          width: Get.width * 0.2,
          child: TextFormField(
            onSaved: (value) => userData.petName.value = value.toString(),
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
          width: Get.width * 0.2,
          child: DropdownSearch<dynamic>(
            mode: Mode.MENU,
            items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            onChanged: (value) {
              userData.periodWeek.value = value;
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
          width: Get.width * 0.5,
          child: TextFormField(
            onSaved: (value) => userData.address.value = value.toString(),
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
        onChanged: (value) {
          userData.petfood.value = value.toString();
        },
      ),
    );
  }

  Widget selectCredit() {
    return Container(
      height: 60,
      width: 200,
      child: DropdownSearch<dynamic>(
        mode: Mode.MENU,
        items: credit,
        selectedItem: '결제 방법',
        onChanged: (value) {
          userData.credit.value = value;
        },
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
          print(userData.address.value);
          infoData.setUserList({
            'userName': userData.userName.value,
            'userPhonenumber': userData.userPhonenumber.value,
            'petName': userData.petName.value,
            'periodWeek': userData.periodWeek.value,
            'address': userData.address.value,
            'petfood': userData.petfood.value,
            'date': userData.periodWeek.value * 7,
            'credit': userData.credit.value,
            'registerDate': DateFormat.yMd('ko').format(DateTime.now()),
          });
          print(infoData.userList);
        },
        child: Text('구독하기'),
      ),
    );
  }
}
