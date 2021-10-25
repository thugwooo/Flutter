import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:louis_home_sub/component/style.dart';
import 'package:louis_home_sub/data/sub.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  var itemName = [
    '샴푸',
    '눈세정제',
    '귀세정제',
    '에센스',
    '미스트',
    '치약',
  ];
  var selectedItemId = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors[0],
        leading: Image.asset(
          'lib/images/png/LOGO-WHITE.png',
          width: 30,
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
      height: 800,
      width: 140,
      margin: EdgeInsets.all(40),
      child: ListView.builder(
        itemCount: itemName.length,
        itemBuilder: (context, index) => InkWell(
          child: Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: index == selectedItemId ? colors[0] : colors[1],
                ),
                borderRadius: BorderRadius.circular(10)),
            width: 100,
            height: 60,
            child: Center(
              child: Text(
                itemName[index],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }

  Widget rightList() {
    return Container(
      margin: EdgeInsets.all(10),
      width: 1000,
      height: 700,
      child: GridView.builder(
        itemCount:
            subData[selectedItemId].length, //여기에 selectedItemId 를 통해 구현해야함
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
              color: Colors.grey,
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
                  //'lib/images/sub/강아지 버블 샴푸.png',
                  'lib/images/sub/' +
                      subData[selectedItemId][index]["name"].toString() +
                      ".png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(subData[selectedItemId][index]["brand"].toString()),
                Text(subData[selectedItemId][index]["name"].toString()),
                Text(
                  '가격',
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
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width - 350,
                    child: Row(
                      children: [
                        Container(
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  'lib/images/sub/' +
                                      subData[selectedItemId][index]["name"]
                                          .toString() +
                                      ".png",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                subData[selectedItemId][index]["brand"]
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                subData[selectedItemId][index]["name"]
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
                          width: 500,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "•  향               ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    subData[selectedItemId][index]["scent"]
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
                                    subData[selectedItemId][index]["scentIn"]
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
                                subData[selectedItemId][index]["hash"]
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
                                  subData[selectedItemId][index]["ingredient"]
                                      .toString(),
                                  softWrap: true),
                              SizedBox(height: 6),
                              Text(subData[selectedItemId][index]["cautionExp"]
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
