import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:louishome/components/screens/dog_screen.dart';
import 'package:louishome/components/screens/dogsc.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('고르시오.'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 36, 79, 1),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            InkWell(
              child: Container(
                margin: EdgeInsets.only(left:40),
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(0, 36, 79, 1),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text('강아지',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DogScreen2();
                }));
              },
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(right:40),
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(0, 36, 79, 1),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text('고양이',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DogScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
