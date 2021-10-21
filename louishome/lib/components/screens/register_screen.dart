import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  var phoneNumber;
  var name;
  var pet = ["강아지", "고양이"];
  var petType = "";
  var colors = [Color.fromRGBO(0, 36, 79, 1), Colors.grey];
  var selectedPetId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('고르시오.'),
        leading: Image.asset(
          'images/png/LOGO-WHITE.png',
          height: 100,
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 36, 79, 1),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                      '반려동물  이름',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 40),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          name = value;
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
                      '휴 대 폰  번 호',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 40),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '휴대폰 번호',
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          phoneNumber = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 240,
                child: ListView.builder(
                  itemCount: pet.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color:
                                index == selectedPetId ? colors[0] : colors[1],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(10),
                      width: 90,
                      height: 60,
                      //color: index == selectedSexId ? colors[0] : colors[1],
                      child: Center(
                        child: Text(
                          pet[index],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedPetId = index;
                        petType = pet[selectedPetId];
                        print(pet[index]);
                      });
                    },
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('제출'),
                onPressed: () {
                  _formKey.currentState!.save();
                  if (petType == "강아지") {
                  } else if (petType == "고양이") {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
