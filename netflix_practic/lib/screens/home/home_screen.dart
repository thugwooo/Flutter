import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_practic/screens/home/components/label_icon.dart';
import 'package:netflix_practic/screens/home/components/play_button.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    List<String> posters = [
      'assets/images/big_buck_bunny_poster.jpg',
      'assets/images/les_miserables_poster.jpg',
      'assets/images/minari_poster.jpg',
      'assets/images/the_book_of_fish_poster.jpg',
    ];
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: Center(
              child: Text(
                'M',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              Icon(FontAwesomeIcons.chromecast),
              SizedBox(width: 25),
              Icon(FontAwesomeIcons.search),
              SizedBox(width: 25),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    image: AssetImage('assets/images/dog.jpg'),
                  ),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
          SliverAppBar(
            textTheme: TextTheme(headline6: TextStyle(fontSize: 18)),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            pinned: true,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('TV 프로그램'),
                Text('영화'),
                Text('내가 찜한 콘텐츠'),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: appSize.height * 0.6,
              child: Column(
                children: [
                  Text(
                    '오늘 한국에서 콘텐츠 순위 1위',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LabelIcon(
                          icon: FontAwesomeIcons.plus, label: '내가 찜한 콘텐츠'),
                      PlayButton(width: 80),
                      LabelIcon(icon: Icons.info_outline, label: '정보'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 40, left: 10),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '오늘 한국의 ',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
