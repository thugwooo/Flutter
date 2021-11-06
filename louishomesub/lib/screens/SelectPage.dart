import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:louishomesub/component/style.dart';
import 'package:louishomesub/data/sub.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  var itemName = [
    '샴푸',
    '눈세정제',
    '귀세정제',
    '에센스/미스트',
    '치약',
  ];
  var pet = ['강아지', '고양이'];
  var selectedItemId = 0;
  var selectedPetId = 0;
  var subData;
  var expColor = [Colors.red, Colors.black, Colors.black];
  @override
  void initState() {
    super.initState();
    subData = data;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors[0],
        title: Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Image.asset(
              'images/png/루이스홈 세로.png',
              width: 200,
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          leftList(),
          rightList(),
        ],
      ),
    );
  }

  Widget leftList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.74,
      width: MediaQuery.of(context).size.width * 0.13,
      margin: EdgeInsets.all(35),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.12,
            child: ListView.builder(
              itemCount: itemName.length,
              itemBuilder: (context, index) => InkWell(
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: index == selectedItemId ? colors[0] : colors[1],
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 55,
                  child: Center(
                    child: Text(
                      itemName[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NanumBarunGothic',
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedItemId = index;
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(70, 90, 0, 0),
            height: MediaQuery.of(context).size.height * 0.125,
            width: MediaQuery.of(context).size.width * 0.06,
            child: ListView.builder(
              itemCount: pet.length,
              itemBuilder: (context, index) => InkWell(
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: index == selectedPetId ? Colors.red : colors[1],
                    ),
                  ),
                  width: 80,
                  height: 45,
                  child: Center(
                    child: Text(
                      pet[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NanumBarunGothic',
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedPetId = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rightList() {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.73,
      width: MediaQuery.of(context).size.width * 0.77,
      child: GridView.builder(
        itemCount: subData[selectedItemId][selectedPetId]
            .length, //여기에 selectedItemId 를 통해 구현해야함
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        itemBuilder: (context, index) => InkWell(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: colors[1],
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  blurRadius: 10,
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  //            'images/sub/강아지 버블 샴푸.png',
                  'images/sub/' +
                      subData[selectedItemId][selectedPetId][index]["name"]
                          .toString() +
                      ".png",
                  width: 150,
                  height: 150,
                ),
                Text(
                  subData[selectedItemId][selectedPetId][index]["brand"]
                      .toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontFamily: 'NanumBarunGothic',
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  subData[selectedItemId][selectedPetId][index]["name"]
                      .toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'NanumBarunGothic',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subData[selectedItemId][selectedPetId][index]["price"]
                          .toString() +
                      ' 원',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'NanumBarunGothic',
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            print(subData[selectedItemId][selectedPetId][index]["cautionExp"]!
                .length);
            print(subData[selectedItemId][selectedPetId][index]["rec"]);
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                scrollable: true,
//                title: Text("이름"),
                content: Builder(builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: colors[0],
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Image.asset(
                                  'images/sub/' +
                                      subData[selectedItemId][selectedPetId]
                                              [index]["name"]
                                          .toString() +
                                      ".png",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                subData[selectedItemId][selectedPetId][index]
                                        ["brand"]
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'NanumBarunGothic',
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                subData[selectedItemId][selectedPetId][index]
                                        ["name"]
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'NanumBarunGothic',
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                subData[selectedItemId][selectedPetId][index]
                                            ["price"]
                                        .toString() +
                                    ' 원',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'NanumBarunGothic',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        makeShampoo(index)
                        /*
                        if (selectedItemId == 0) makeShampoo(index),
                        if (0 < selectedItemId && selectedItemId < 4)
                          makeEye(index),
                        if (selectedItemId == 4) makeTooth(index),
                        */
                      ],
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget makeShampoo(var index) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.49,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Row(
              children: [
                Text(
                  "•  향",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'NanumBarunGothic',
                    fontSize: 18,
                  ),
                ),
                Text(
                  " 약 사용 형태    ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'NanumBarunGothic',
                  ),
                ),
                Text(
                  subData[selectedItemId][selectedPetId][index]["scent"]
                      .toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'NanumBarunGothic',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            if (selectedItemId == 0)
              Row(
                children: [
                  Text(
                    "•  향 강도",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NanumBarunGothic',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "아 형태     ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NanumBarunGothic',
                    ),
                  ),
                  Text(
                    subData[selectedItemId][selectedPetId][index]["scentIn"]
                        .toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NanumBarunGothic',
                    ),
                  ),
                ],
              ),
            if (selectedItemId == 0)
              Row(
                children: [
                  Text(
                    "•  린스 겸용",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NanumBarunGothic',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    " 형태     ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NanumBarunGothic',
                    ),
                  ),
                  Text(
                    subData[selectedItemId][selectedPetId][index]["rinse"]
                        .toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NanumBarunGothic',
                    ),
                  )
                ],
              ),
            if (selectedItemId == 4)
              Row(
                children: [
                  Text(
                    "•  치약 사용 형태     ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NanumBarunGothic',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subData[selectedItemId][selectedPetId][index]["toothform"]
                        .toString(),
                    style: TextStyle(
                      fontFamily: 'NanumBarunGothic',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            if (subData[selectedItemId][selectedPetId][index]["rec"]!.length >
                1)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•  추천 대상",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NanumBarunGothic',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    " 형태     ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NanumBarunGothic',
                    ),
                  ),
                  Text(
                    subData[selectedItemId][selectedPetId][index]["rec"]
                        .toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NanumBarunGothic',
                    ),
                    softWrap: true,
                  )
                ],
              ),
            SizedBox(
              height: 10,
            ),
            Text(
              subData[selectedItemId][selectedPetId][index]["hash"].toString(),
              style: TextStyle(
                color: colors[0],
                fontWeight: FontWeight.w700,
                fontFamily: 'NanumBarunGothic',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "•  전성분      ",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'NanumBarunGothic',
                fontSize: 18,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6,
                ),
                Text(
                  subData[selectedItemId][selectedPetId][index]["ingredient"]
                      .toString(),
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'NanumBarunGothic',
                  ),
                  softWrap: true,
                ),
                SizedBox(height: 6),
                if (subData[selectedItemId][selectedPetId][index]["cautionExp"]!
                        .length >
                    1)
                  for (var i = 0;
                      i <
                          subData[selectedItemId][selectedPetId][index]
                                  ["cautionExp"]!
                              .length;
                      i++)
                    Column(
                      children: [
                        Text(
                          subData[selectedItemId][selectedPetId][index]
                                  ["cautionExp"][i]
                              .toString(),
                          style: TextStyle(
                            color: expColor[i % 3],
                            fontFamily: 'NanumBarunGothic',
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
