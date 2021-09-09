import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShowPetfood extends StatefulWidget {
  final data;
  ShowPetfood({this.data});
  @override
  _ShowPetfoodState createState() => _ShowPetfoodState();
}

class _ShowPetfoodState extends State<ShowPetfood> {
  final items = [
    Image.asset('image/dice1.png', fit: BoxFit.cover),
    Image.asset('image/dice2.png', fit: BoxFit.cover),
    Image.asset('image/dice3.png', fit: BoxFit.cover),
    Image.asset('image/dice4.png', fit: BoxFit.cover),
    Image.asset('image/dice5.png', fit: BoxFit.cover),
    Image.asset('image/dice6.png', fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이거슨!! 사료닷' + widget.data.toString(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
          margin: EdgeInsets.all(20.0),
          // 컨테이너의 높이를 200으로 설정
          height: 200.0,
          // 리스트뷰 추가
          child: ListView(
            // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
            scrollDirection: Axis.horizontal,
            // 컨테이너들을 ListView의 자식들로 추가
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('사진'),
                    Text('브랜드'),
                    Text('간단한설명'),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('사진'),
                    Text('브랜드'),
                    Text('간단한설명'),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('사진'),
                    Text('브랜드'),
                    Text('간단한설명'),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('사진'),
                    Text('브랜드'),
                    Text('간단한설명'),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('사진'),
                    Text('브랜드'),
                    Text('간단한설명'),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.indigo,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('사진'),
                    Text('브랜드'),
                    Text('간단한설명'),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('사진'),
                    Text('브랜드'),
                    Text('간단한설명'),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('사진'),
                    Text('브랜드'),
                    Text('간단한설명'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
