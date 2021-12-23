import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:louishometest2/data/style.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _addressFlag = false;
  bool _petinfoFlag = false;
  bool _petfoodFlag = false;
  bool _userInfoFlag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ㅎㅇ'),
        backgroundColor: colors[0],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          subscribeStack(),
          subSupervise(),
        ],
      ),
      bottomNavigationBar: navi(),
    );
  }

  Widget subSupervise() {
    return Stack(
      children: [
        superviseMain(),
        if (_userInfoFlag) userInfoDialog(),
      ],
    );
  }

  Widget superviseMain() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          tableInfo(),
          Divider(
            thickness: 2,
            color: colors[0],
          ),
          userList(),
        ],
      ),
    );
  }

  Widget tableInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('          이름'),
        Text('                       사료'),
        Text('배송까지 남은 기간'),
      ],
    );
  }

  Widget userList() {
    return Expanded(
      child: Container(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: colors[0],
            thickness: 1,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  _userInfoFlag = true;
                });
              },
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '보호자 이름$index',
                        ),
                        Text('반려동물 이름')
                      ],
                    ),
                    Text('사료 이름'),
                    Text('            $index일')
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget userInfoDialog() {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.1,
      top: MediaQuery.of(context).size.height * 0.05,
      child: InkWell(
        onTap: () {
          setState(() {
            _userInfoFlag = false;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: colors[0],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('보호자 정보, 반려동물 정보, 사료 변경, 배송기간 변경 기능'),
            ],
          ),
        ),
      ),
    );
  }

  Widget subscribeStack() {
    return Stack(
      children: [
        subcribeMain(),
        if (_addressFlag) addressDialog(),
        if (_petfoodFlag) petfoodDialog(),
        if (_petinfoFlag) petInfoDialog(),
      ],
    );
  }

  Widget addressDialog() {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.1,
      top: MediaQuery.of(context).size.height * 0.05,
      child: InkWell(
        onTap: () {
          setState(() {
            _addressFlag = false;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: colors[0],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('웹에서 보는거 같은 주소검색 시스템'),
            ],
          ),
        ),
      ),
    );
  }

  Widget petInfoDialog() {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.1,
      top: MediaQuery.of(context).size.height * 0.05,
      child: InkWell(
        onTap: () {
          setState(() {
            _petinfoFlag = false;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: colors[0],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('이름'),
              Text('중성화'),
              Text('견/묘종'),
              Text('성별'),
              Text('생일'),
              Text('알러지'),
              Text('건강고려사항'),
            ],
          ),
        ),
      ),
    );
  }

  Widget petfoodDialog() {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.1,
      top: MediaQuery.of(context).size.height * 0.05,
      child: InkWell(
        onTap: () {
          setState(() {
            _petfoodFlag = false;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: colors[0],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('큐레이션과 비슷하게 보여지면서 검색 기능'),
            ],
          ),
        ),
      ),
    );
  }

  Widget subcribeMain() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            '정보 입력',
            style: infoStyle,
          ),
          SizedBox(height: 20),
          subscribeName(),
          SizedBox(height: 20),
          subscribePhone(),
          SizedBox(height: 20),
          subscribeAddress(),
          SizedBox(height: 20),
          subscribePetInfo(),
          SizedBox(height: 20),
          subscribeDate(),
          SizedBox(height: 20),
          subscribePetfood(),
          SizedBox(height: 20),
          subscribePetfoodIMG(),
          SizedBox(height: 20),
          subscribeButton(),
        ],
      ),
    );
  }

  Widget subscribeButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('구독하기'),
    );
  }

  Widget subscribePetfoodIMG() {
    return Container(
      width: 100,
      height: 100,
      decoration: line,
      child: Center(child: Text('사료 이미지')),
    );
  }

  Widget subscribePetfood() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('  사료 선택  ', style: infosmallStyle),
        InkWell(
          onTap: () {
            setState(() {
              _petfoodFlag = true;
            });
          },
          child: Container(
            width: 100,
            height: 25,
            decoration: line,
            child: Center(
              child: Text(
                '사료 찾기',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget subscribeDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('  배송 기간  ', style: infosmallStyle),
        Container(
          width: 100,
          height: 25,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget subscribePetInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('  반려 동물  ', style: infosmallStyle),
        InkWell(
          onTap: () {
            setState(() {
              _petinfoFlag = true;
            });
          },
          child: Container(
            width: 100,
            height: 25,
            decoration: line,
            child: Center(
              child: Text(
                '정보 입력',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget subscribeAddress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '  주소 입력  ',
          style: infosmallStyle,
        ),
        InkWell(
          onTap: () {
            setState(() {
              _addressFlag = true;
            });
          },
          child: Container(
            width: 100,
            height: 25,
            decoration: line,
            child: Center(
              child: Text(
                '주소 검색',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget subscribePhone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '휴대폰 번호',
          style: infosmallStyle,
        ),
        Container(
          width: 100,
          height: 25,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget subscribeName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '보호자 이름',
          style: infosmallStyle,
        ),
        Container(
          width: 100,
          height: 25,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget navi() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '구독하기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '구독관리',
        ),
      ],
      onTap: (index) => {
        setState(
          () {
            _selectedIndex = index;
          },
        )
      },
      currentIndex: _selectedIndex,
    );
  }
}
