import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishomewebtest/data/controller.dart';
import 'package:louishomewebtest/data/style.dart';
import 'package:louishomewebtest/screens/subscription_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  indexController c = Get.put(indexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Container(
            width: context.width * 0.5,
            height: context.height,
            child: Column(
              children: [
                SizedBox(height: 20),
                upperButton(),
                SizedBox(height: 20),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                IndexedStack(
                  index: c.selectedIndex.value,
                  children: [
                    subscriptionScreen(),
                    Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget upperButton() {
  indexController c = Get.put(indexController());
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      InkWell(
        onTap: () {
          c.indexedButton(0);
        },
        child: Container(
          child: Text(
            '구독하기',
            style: infoStyle,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          c.indexedButton(1);
        },
        child: Container(
          child: Text(
            '구독정보',
            style: infoStyle,
          ),
        ),
      ),
    ],
  );
}
