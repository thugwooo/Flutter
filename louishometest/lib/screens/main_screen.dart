import 'package:flutter/material.dart';
import 'package:louishometest/data/style.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var infoFlag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors[0],
        centerTitle: true,
        title: Image.asset(
          'images/png/루이스홈 세로.png',
          width: 200,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          })
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '구독하기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '구독정보',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('정보입력'),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text('보호자 이름'),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('보호자 주소'),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 20,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('주소검색'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('반려동물 이름'),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('반려동물 정보'),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                infoFlag = true;
                              });
                            },
                            child: Text('정보 입력'),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('사료'),
                        SizedBox(
                          width: 75,
                        ),
                        Text('선택된 사료 이름 or 사료 선택')
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('배송 받고 싶은 기간'),
                        Container(
                          width: 100,
                          height: 20,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Text('일')
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('구독하기'),
                      ),
                    )
                  ],
                ),
              ),
              if (infoFlag)
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.05,
                  child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.7,
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
                      child: Column(
                        children: [
                          Text('큐레이션에 들어가는 반려동물 정보입력'),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        infoFlag = false;
                      });
                    },
                  ),
                ),
            ],
          ),
          Container(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('이름'),
                              Text('반려동물 이름'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('구독하는 사료'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('배송까지 남은 기간'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
