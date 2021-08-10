import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FullPage(),
        )
      )
    )
  );
}

class FullPage extends StatefulWidget{
  const FullPage({Key key}) : super(key: key);

  @override
  _FullPageState createState() => _FullPageState();
}

class _FullPageState extends State<FullPage>{
  Map<String, dynamic> fruitData;
  int selectedIndex;

  @override
  void initState(){
    super.initState();
    selectedIndex = 0;
    fruitData = fruits[selectedIndex];

  }

  void updateActiveFruit(int fruitIndex){
    setState((){
      selectedIndex = fruitIndex;
      fruitData = fruits[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width,
          child: TopCardWidget(
            name: fruitData['name'],
            family: fruitData['family'],
            bannerImage: fruitData['bannerImage'],
            numStars: fruitData['tastiness'],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height - 
                  (MediaQuery.of(context).size.width / 2),
          width: MediaQuery.of(context).size.width,
          child: FruitCardList(
            selectedIndex: selectedIndex,
            fruitData: fruits,
            onTap: updateActiveFruit,
            paddingBottom: 80,
          ),
        ),
        Positioned(
          bottom: 0,
          height: 75,
          width: MediaQuery.of(context).size.width,
          child: CustomTabBar(),
        )
      ]
    );
  }
}

class FruitCardList extends StatelessWidget {
  final List<Map> fruitData;
  final int selectedIndex;
  final void Function(int) onTap;
  final double paddingBottom;
  
  const FruitCardList({
    @required this.fruitData,
    this.selectedIndex,
    this.onTap,
    this.paddingBottom = 0,
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    List<Widget> fruitCards =
        Iterable<int>.generate(fruitData.length).toList().map((int counter) {
      return GestureDetector(
        onTap: () {
          onTap(counter);
        },
        child: FruitCard(
          assetUrl: fruitData[counter]['squareImage'],
          family: fruitData[counter]['family'],
          healthInfo: fruitData[counter]['healthInfo'],
          numLikes: fruitData[counter]['numLikes'],
          numDislikes: fruitData[counter]['numDislikes'],
          isLiked: fruitData[counter]['isLiked'] ?? false,
          isDisliked: fruitData[counter]['isDisliked'] ?? false,
          title: fruitData[counter]['name'],
          isSelected: selectedIndex == counter,
        ),
      );
    }).toList();
    
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ...fruitCards,
        paddingBottom > 0 ? SizedBox(height: paddingBottom) : Container(),
      ]
    );
  }
}
Color grey = const Color(0xFFDDDDDD);
Color darkGrey = const Color(0xFFBBBBBB);

class FruitCard extends StatelessWidget {
  final String assetUrl;
  final String title;
  final String healthInfo;
  final int numLikes;
  final int numDislikes;
  final bool isLiked;
  final bool isDisliked;
  final String family;
  final bool isSelected;
  const FruitCard({
    @required this.assetUrl,
    @required this.title,
    @required this.healthInfo,
    @required this.family,
    this.numLikes = 0,
    this.numDislikes = 0,
    this.isLiked = false,
    this.isDisliked = false,
    this.isSelected = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalMargin = 5;
    double cardPadding = 12;
    double pictureAndRatings = 164;
    return Card(
      margin: EdgeInsets.all(horizontalMargin),
      child: Container(
        height: 120,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: cardPadding,
              top: cardPadding,
              height: 96,
              child: Container(
                width: MediaQuery.of(context).size.width -
                    (cardPadding * 2) -
                    (horizontalMargin * 2) -
                    pictureAndRatings,

                // Pass necessary variables through to child widgets
                child: FruitInfo(
                  name: title,
                  healthInfo: healthInfo,
                  family: family,
                  isSelected: isSelected,
                ),
              ),
            ),
            Positioned(
              right: pictureAndRatings - 30,
              top: 20,
              // Pass necessary variables through to child widgets
              child: RatingButton(
                numRatings: numLikes,
                icon: Icons.thumb_up,
                ratingStatus: isLiked
                    ? RatingStatus.liked
                    : RatingStatus.none,
              ),
            ),
            Positioned(
              right: pictureAndRatings - 30,
              bottom: 20,
              // Pass necessary variables through to child widgets
              child: RatingButton(
                numRatings: numDislikes,
                icon: Icons.thumb_down,
                ratingStatus: isDisliked
                    ? RatingStatus.disliked
                    : RatingStatus.none,
              ),
            ),
            Positioned(
              right: 0,
              child: CDNImage.network(assetUrl, height: 120),
            ),
          ],
        ),
      ),
    );
  }
}
class FruitInfo extends StatelessWidget {
  final String name;
  final String healthInfo;
  final String family;
  final bool isSelected;
  const FruitInfo({
    @required this.name,
    @required this.healthInfo,
    @required this.family,
    this.isSelected = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: Theme.of(context).textTheme.headline.copyWith(color: isSelected ? Colors.pink : Colors.black),
        ),
        Text(
          healthInfo,
          style: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(fontWeight: FontWeight.w200),
        ),
        Text(
          family,
          style: TextStyle(
              color: Colors.pink, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
enum RatingStatus { liked, disliked, none }

class RatingButton extends StatelessWidget {
  final int numRatings;
  final IconData icon;
  final RatingStatus ratingStatus;

  const RatingButton({
    this.numRatings,
    this.icon,
    this.ratingStatus = RatingStatus.none,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Map<RatingStatus, Color> borderColors = {
      RatingStatus.none: grey,
      RatingStatus.liked: Colors.green[400],
      RatingStatus.disliked: Colors.red[400],
    };

    Map<RatingStatus, Color> buttonColors = {
      RatingStatus.none: grey,
      RatingStatus.liked: Colors.green[700],
      RatingStatus.disliked: Colors.red[700],
    };

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: borderColors[ratingStatus]),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(numRatings.toString(), style: TextStyle(
            color: buttonColors[ratingStatus],
          )),
          SizedBox(width: 4),
          Icon(icon, size: 16, color: buttonColors[ratingStatus]),
        ],
      ),
    );
  }
}
class TopCardWidget extends StatelessWidget{
  final String name;
  final String family;
  final String bannerImage;
  final int numStars;
  const TopCardWidget({
    @required this.name,
    @required this.family,
    @required this.bannerImage,
    @required this.numStars,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    List<Widget> stars =Iterable<int>.generate(numStars).toList().map((_)
    {
      return Icon(Icons.star, color: Colors.yellow);
    }).toList();
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: CDNImage.network(bannerImage, fit: BoxFit.fill),
        ),

        Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0x77000000),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),

                    Text(
                      family,
                      style:TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(children: stars),
                  ],
                )
              ]
            )
          )
        )
      ]
    );
  }
}

class CustomTabBar extends StatefulWidget{
  const CustomTabBar({Key key}) : super(key: key);

  @override
  _CustomTabBarState createState()=> _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> 
  with TickerProviderStateMixin {

  int activeIndex;

  @override
  void initState() {
    super.initState();
    activeIndex = 1;
  }

  void changeActiveTab(int index) {
    setState((){
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFDDDDDD),
            width: 1,
          ),
        ),
        color: Color(0xDDFFFFFF),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0,10,0,20),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TabBarIcon(
                icon: Icons.person,
                index: 0,
                onTap: changeActiveTab,
                isActive: activeIndex == 0,
                vsyncProvider: this,
              ),
            ),
            Expanded(
              flex:1,
              child: TabBarIcon(
                icon: Icons.home,
                index: 1,
                onTap: changeActiveTab,
                isActive: activeIndex ==1,
                vsyncProvider: this,
              ),
            ),

            Expanded(
              flex: 1,
              child: TabBarIcon(
                icon: Icons.settings,
                index: 2,
                onTap: changeActiveTab,
                isActive: activeIndex == 2,
                vsyncProvider: this,
              )
            )
          ],
        )
      )
    );
  }

}

class TabBarIcon extends StatelessWidget{
  final IconData icon;
  final int index;
  final Function(int) onTap;
  final bool isActive;
  final TickerProvider vsyncProvider;
  const TabBarIcon({
    @required this.icon,
    @required this.index,
    @required this.vsyncProvider,
    @required this.onTap,
    this.isActive = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        onTap(index);
      },

      child: AnimatedSize(
        vsync: vsyncProvider,
        duration: Duration(milliseconds: 300),
        child: Icon(
          icon,
          size: isActive ? 36: 24,
          color: isActive ? Colors.pink : Colors.black,
        )
      )
    );
  }
}



const List<Map<String, dynamic>> fruits = [
  {
    'name': 'Lime',
    'squareImage': 'lime.jpg',
    'bannerImage': 'limes.jpg',
    'healthInfo': '20 calories',
    'family': 'Citrus',
    'numLikes': 7,
    'numDislikes': 2,
    'isLiked': true,
    'tastiness': 4,
  },
  {
    'name': 'Tomato',
    'squareImage': 'tomato.jpg',
    'bannerImage': 'tomatoes.jpg',
    'healthInfo': '24 calories',
    'family': 'Nightshade',
    'numLikes': 10,
    'numDislikes': 3,
    'isLiked': true,
    'tastiness': 4,
  },
  {
    'name': 'Kiwi',
    'squareImage': 'kiwi.jpg',
    'bannerImage': 'kiwis.jpg',
    'healthInfo': '42 calories',
    'family': 'Actinidiaceae',
    'numLikes': 5,
    'numDislikes': 6,
    'isDisliked': true,
    'tastiness': 3,
  },
  {
    'name': 'Lemon',
    'squareImage': 'lemon.jpg',
    'bannerImage': 'lemons.jpg',
    'healthInfo': '17 calories',
    'family': 'Citrus',
    'numLikes': 12,
    'numDislikes': 11,
    'tastiness': 2,
  },
  {
    'name': 'Orange',
    'squareImage': 'orange.jpg',
    'bannerImage': 'oranges.jpg',
    'healthInfo': '45 calories',
    'family': 'Citrus',
    'numLikes': 10,
    'numDislikes': 1,
    'tastiness': 5,
  },
  {
    'name': 'Strawberry',
    'squareImage': 'strawberry.jpg',
    'bannerImage': 'strawberries.jpg',
    'healthInfo': '14 calories',
    'family': 'Berry',
    'numLikes': 21,
    'numDislikes': 1,
    'isLiked': true,
    'tastiness': 5,
  },
  {
    'name': 'Avocado',
    'squareImage': 'avocado.jpg',
    'bannerImage': 'avocados.jpg',
    'healthInfo': '234 calories',
    'family': 'Guacamole ingredients',
    'numLikes': 12,
    'numDislikes': 4,
    'tastiness': 4,
  },
];
class CDNImage extends StatelessWidget {
  final String baseUrl;
  final String uri;
  final double height;
  final double width;
  final BoxFit fit;
  CDNImage(this.baseUrl, this.uri, {this.height, this.width, this.fit});
  CDNImage.network(this.uri, {this.height, this.width, this.fit})
    : baseUrl = 'https://craiglabenz.sfo2.digitaloceanspaces.com/stock-photos/';

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '$baseUrl$uri',
      height: height,
      width: width,
      fit: fit,
    );
  }
}