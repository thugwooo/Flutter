import 'package:flutter/material.dart';
import 'package:louishome/components/data/filtering.dart';
import 'package:louishome/components/data/petfood.dart';

class ShowPetfoodScreen extends StatefulWidget {
  var pet;
  var age;
  var breed;
  var bcsScore;
  var alg;
  var health;
  ShowPetfoodScreen(
      {this.pet, this.age, this.breed, this.bcsScore, this.alg, this.health});

  @override
  _ShowPetfoodScreenState createState() => _ShowPetfoodScreenState();
}

class _ShowPetfoodScreenState extends State<ShowPetfoodScreen> {
  var filteringData;
  @override
  void initState() {
    super.initState();
    filteringData = petfood;
    print(filteringData.length);
    filteringData = filteringAlg(filteringData, widget.alg);
    print(filteringData.length);
    filteringData = filteringHealth(filteringData, widget.health);
    print(filteringData.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사료'),
        centerTitle: true,
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
