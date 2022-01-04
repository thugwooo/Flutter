import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscribeweb/data/style.dart';

class infoScreen extends StatefulWidget {
  @override
  _infoScreenState createState() => _infoScreenState();
}

class _infoScreenState extends State<infoScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            tableInfo(),
            Divider(),
            tableList(),
          ],
        ),
      ],
    );
  }

  Widget tableInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: context.width * 0.16,
          height: context.height * 0.1,
          child: Center(
            child: Text(
              '이름',
              style: infosmallStyle,
            ),
          ),
        ),
        Container(
          width: context.width * 0.16,
          height: context.height * 0.1,
          child: Center(
            child: Text(
              '사료',
              style: infosmallStyle,
            ),
          ),
        ),
        Container(
          width: context.width * 0.16,
          height: context.height * 0.1,
          child: Center(
            child: Text(
              '배송 기간',
              style: infosmallStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget tableList() {
    return Container(
      width: context.width * 0.5,
      height: context.height * 0.5,
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: context.width * 0.16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('보호자 이름'),
                    Text('반려동물 이름'),
                  ],
                ),
              ),
              Container(
                width: context.width * 0.16,
                child: Center(child: Text('사료 이름')),
              ),
              Stack(
                children: [
                  Container(
                    width: context.width * 0.16,
                    child: Center(
                      child: Text('날짜'),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: context.width * 0.01,
                    child: InkWell(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 20,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
