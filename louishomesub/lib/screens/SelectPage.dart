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
  var pet = ['전체', '강아지', '고양이'];
  var selectedItemId = 0;
  var selectedPetId = 0;
  @override
  void initState() {
    super.initState();
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedItemId = index;
                  });
                  print(selectedItemId);
                  print(selectedPetId);
                  print(index);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(70, 35, 0, 0),
            height: MediaQuery.of(context).size.height * 0.19,
            width: MediaQuery.of(context).size.width * 0.06,
            child: ListView.builder(
              itemCount: pet.length,
              itemBuilder: (context, index) => InkWell(
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: index == selectedPetId ? colors[0] : colors[1],
                    ),
                  ),
                  width: 80,
                  height: 45,
                  child: Center(
                    child: Text(
                      pet[index],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedPetId = index;
                  });
                  print(selectedItemId);
                  print(selectedPetId);
                  print(index);
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
      height: MediaQuery.of(context).size.height * 0.72,
      width: MediaQuery.of(context).size.width * 0.75,
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
                  //'images/sub/릴라덴트 덴탈케어 미네랄.png',
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
                    style: TextStyle(color: Colors.grey[700])),
                Text(
                  subData[selectedItemId][selectedPetId][index]["name"]
                      .toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subData[selectedItemId][selectedPetId][index]["price"]
                          .toString() +
                      ' 원',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          onTap: () {
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
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                subData[selectedItemId][selectedPetId][index]
                                        ["name"]
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '가격',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "•  향",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    " 강도       ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    subData[selectedItemId][selectedPetId]
                                            [index]["scent"]
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "•  향 강도       ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    subData[selectedItemId][selectedPetId]
                                            [index]["scentIn"]
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                subData[selectedItemId][selectedPetId][index]
                                        ["hash"]
                                    .toString(),
                                style: TextStyle(
                                  color: colors[0],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "•  전성분      ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                  subData[selectedItemId][selectedPetId][index]
                                          ["ingredient"]
                                      .toString(),
                                  style: TextStyle(fontSize: 13),
                                  softWrap: true),
                              SizedBox(height: 6),
                              Text(subData[selectedItemId][selectedPetId][index]
                                      ["cautionExp"]
                                  .toString()),
                            ],
                          ),
                        )
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
}
