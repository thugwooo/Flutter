import 'package:flutter/material.dart';
import 'package:louishomedisplay/assets/data.dart';

import 'package:louishomedisplay/assets/style.dart';
import 'package:louishomedisplay/assets/sub.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedItemId = 0;
  var selectedPetList = [0];
  var selectedPetId = 1;
  var selectedItemNumber = 0;
  var subData;
  var dialogbool = false;
  var expColor = [
    TextStyle(
      color: Colors.green[900],
      fontSize: 13,
      fontWeight: FontWeight.w700,
    ),
    TextStyle(
      color: Colors.black,
      fontSize: 13,
    ),
    TextStyle(
      color: Colors.black,
      fontSize: 13,
    ),
  ];
  @override
  void initState() {
    super.initState();
    subData = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              leftScreen(),
              rightScreen(),
            ],
          ),
          if (dialogbool)
            Positioned(
              child: dialog(),
              bottom: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.height * 0.15,
            ),
        ],
      ),
    );
  }

  Widget leftScreen() {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
      ),
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftButton(),
          logo(),
        ],
      ),
    );
  }

  Widget leftButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          menubutton(),
          itemView(),
        ],
      ),
    );
  }

  Widget menubutton() {
    return Container(
      height: 70,
      color: colors[0],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬

        children: [
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
          Text(
            ' 메뉴',
            style: TextStyle(
              color: Colors.white,
              fontFamily: font,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  Widget itemView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 1),
          itemButton(0),
          Divider(
            thickness: 1,
          ),
          itemButton(1),
          Divider(
            thickness: 1,
          ),
          itemButton(2),
          Divider(
            thickness: 1,
          ),
          itemButton(3),
          Divider(
            thickness: 1,
          ),
          itemButton(4),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget itemButton(var index) {
    return InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Container(
              child: Text(
                itemName[index].toString(),
                style: TextStyle(
                  fontFamily: font,
                  fontWeight: selectedItemId == index ? bold[0] : bold[1],
                  fontSize: 25,
                  color: selectedItemId == index ? colors[0] : colors[1],
                ),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
        onTap: () {
          setState(() {
            selectedItemId = index;
          });
        });
  }

  Widget logo() {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Image.asset(
        'images/png/루이스홈 세로.png',
        color: colors[0],
        width: MediaQuery.of(context).size.width * 0.18,
      ),
    );
  }

  Widget rightScreen() {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
      ),
      height: MediaQuery.of(context).size.height * 0.79,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          petbuttons(),
          showbuilder(),
        ],
      ),
    );
  }

  Widget petbuttons() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.ac_unit, color: Colors.white),
          petsinglebutton(0),
          petsinglebutton(1),
          Icon(Icons.ac_unit, color: Colors.white),
        ],
      ),
    );
  }

  Widget petsinglebutton(var index) {
    return InkWell(
      child: Container(
        width: 200,
        height: 60,
        decoration: BoxDecoration(
          color: selectedPetList.contains(index) ? colors[0] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2, 2),
              blurRadius: 1,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-2, -2),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: selectedPetList.contains(index) ? Colors.white : colors[1],
            ),
            Text(
              "  " + pet[index].toString(),
              style: TextStyle(
                color:
                    selectedPetList.contains(index) ? Colors.white : colors[1],
                fontWeight: selectedPetList.contains(index) ? bold[0] : bold[1],
                fontFamily: font,
                fontSize: 32,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        setState(
          () {
            selectedPetList.contains(index)
                ? selectedPetList.remove(index)
                : selectedPetList.add(index);
            print(selectedPetList);
            if (selectedPetList.length == 2 || selectedPetList.length == 0) {
              selectedPetId = 0;
            } else {
              if (selectedPetList.contains(0)) {
                selectedPetId = 1;
              } else {
                selectedPetId = 2;
              }
            }
          },
        );
      },
    );
  }

  Widget showbuilder() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: GridView.builder(
          itemCount: subData[selectedItemId][selectedPetId].length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) => InkWell(
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: 170,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 2),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-2, -2),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          child: Image.asset(
                            //            'images/sub/강아지 버블 샴푸.png',
                            'images/sub/' +
                                subData[selectedItemId][selectedPetId][index]
                                        ["name"]
                                    .toString() +
                                ".png",
                            height: 120,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          subData[selectedItemId][selectedPetId][index]["brand"]
                              .toString(),
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          subData[selectedItemId][selectedPetId][index]["name"]
                              .toString(),
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: subData[selectedItemId][selectedPetId]
                                            [index]["name"]
                                        .length >
                                    10
                                ? 14
                                : 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          subData[selectedItemId][selectedPetId][index]["price"]
                                  .toString() +
                              ' 원',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Icon(
                      Icons.add_circle,
                      color: colors[0],
                    ),
                    top: 20,
                    right: 20,
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  dialogbool = true;
                  selectedItemNumber = index;
                });
              }),
        ),
      ),
    );
  }

  Widget dialog() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 2),
                blurRadius: 1,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-2, -2),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              leftDialog(),
              rightDialog(),
            ],
          ),
        ),
        Positioned(
          child: InkWell(
              child: Icon(Icons.cancel, size: 50),
              onTap: () {
                setState(() {
                  dialogbool = false;
                });
              }),
          bottom: 0,
          left: MediaQuery.of(context).size.width * 0.4,
        ),
      ],
    );
  }

  Widget leftDialog() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.29,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            //            'images/sub/강아지 버블 샴푸.png',
            'images/sub/' +
                subData[selectedItemId][selectedPetId][selectedItemNumber]
                        ["name"]
                    .toString() +
                ".png",
            height: 250,
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 2,
            indent: 50,
            endIndent: 50,
            color: colors[0],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subData[selectedItemId][selectedPetId][selectedItemNumber]["brand"]
                .toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subData[selectedItemId][selectedPetId][selectedItemNumber]["name"]
                .toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subData[selectedItemId][selectedPetId][selectedItemNumber]["price"]
                    .toString() +
                ' 원',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget rightDialog() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          rightupDialog(),
          rightdownDialog(),
        ],
      ),
    );
  }

  Widget rightupDialog() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.44,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '정보',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 5),
          Divider(
            thickness: 2,
            color: colors[0],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              scent(),
              if (selectedItemId == 0 &&
                  subData[selectedItemId][selectedPetId][selectedItemNumber]
                              ["rinse"]
                          .length >
                      2)
                rinse(),
              if (selectedItemId == 0) scentIn(),
              if (selectedItemId == 1) tooth(),
            ],
          ),
          Divider(
            thickness: 1,
            color: colors[0],
          ),
          rec(),
          hash(),
        ],
      ),
    );
  }

  Widget hash() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        for (var i = 0;
            i <
                subData[selectedItemId][selectedPetId][selectedItemNumber]
                        ["hash"]
                    .length;
            i++)
          Text(
            '    ' +
                subData[selectedItemId][selectedPetId][selectedItemNumber]
                        ["hash"][i]
                    .toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: colors[0],
            ),
          ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget rec() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          '   추천대상',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        for (var i = 0;
            i <
                subData[selectedItemId][selectedPetId][selectedItemNumber]
                        ["rec"]
                    .length;
            i++)
          Text(
            '    ' +
                subData[selectedItemId][selectedPetId][selectedItemNumber]
                        ["rec"][i]
                    .toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        if (subData[selectedItemId][selectedPetId][selectedItemNumber]
                    ["productExp"]
                .toString()
                .length >
            5)
          SizedBox(height: 8),
        if (subData[selectedItemId][selectedPetId][selectedItemNumber]
                    ["productExp"]
                .toString()
                .length >
            5)
          Text(
            '   제품 설명',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        if (subData[selectedItemId][selectedPetId][selectedItemNumber]
                    ["productExp"]
                .toString()
                .length >
            5)
          SizedBox(height: 8),
        if (subData[selectedItemId][selectedPetId][selectedItemNumber]
                    ["productExp"]
                .toString()
                .length >
            5)
          Container(
            margin: EdgeInsets.only(left: 12),
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              subData[selectedItemId][selectedPetId][selectedItemNumber]
                      ["productExp"]
                  .toString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        Divider(
          thickness: 1,
          color: colors[0],
        ),
      ],
    );
  }

  Widget tooth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '치약 사용 형태',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subData[selectedItemId][selectedPetId][selectedItemNumber]
                  ["toothform"]
              .toString(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget scent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          '   향',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '    ' +
              subData[selectedItemId][selectedPetId][selectedItemNumber]
                      ["scent"]
                  .toString(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget scentIn() {
    return Column(
      children: [
        SizedBox(height: 8),
        Text(
          '향 강도',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subData[selectedItemId][selectedPetId][selectedItemNumber]["scentIn"]
              .toString(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget rinse() {
    return Text(
      '린스 겸용',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }

  Widget rightdownDialog() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '전성분',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 5),
              Divider(
                thickness: 2,
                color: colors[0],
              ),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.only(left: 11),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  subData[selectedItemId][selectedPetId][selectedItemNumber]
                          ["ingredient"]
                      .toString(),
                  softWrap: true,
                ),
              ),
              SizedBox(height: 8),
              Divider(
                thickness: 1,
                color: colors[0],
              ),
              if (subData[selectedItemId][selectedPetId][selectedItemNumber]
                          ["cautionExp"]!
                      .length >
                  1)
                for (var i = 0;
                    i <
                        subData[selectedItemId][selectedPetId]
                                [selectedItemNumber]["cautionExp"]!
                            .length;
                    i++)
                  Container(
                    child: Row(
                      children: [
                        if (i % 3 == 0)
                          Text(
                            '    ' + '※ ',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 13,
                            ),
                          ),
                        Flexible(
                          child: Text(
                            '    ' +
                                subData[selectedItemId][selectedPetId]
                                        [selectedItemNumber]["cautionExp"][i]
                                    .toString(),
                            style: expColor[i % 3],
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
