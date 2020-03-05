import 'package:flutter/material.dart';

void main() async{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomTabBar'),
        ),
        body: TabBarExamplePage(),
      ),
    ),
  );
}

class TabBarExamplePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index){
              return Image
                    .network('https://picsum.photos/id/${index * 7}/400/200');
            }
          )
        ),

        Positioned(
          bottom: 0,
          child: CustomTabBar()
        ),
      ],
    );
  }
}

class CustomTabBar extends StatefulWidget{
  const CustomTabBar ({Key key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> 
with TickerProviderStateMixin{

  int activeIndex;
  
  @override
  void initState(){
    super.initState();
    activeIndex =1;
  }

  void changeActiveTab(int index){ 
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
      child: ClipRect(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TabBarIcon(
                  icon: Icons.person,
                  index: 0,
                  onTap: changeActiveTab,
                  isActive: activeIndex==1,
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
                ),
              ),
            ] ,
          ),
        ),
      ),
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
    @required this.onTap,
    @required this.vsyncProvider,
    this.isActive =false,
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
          size: isActive ? 36 : 24,
          color: isActive ? Colors.pink: Colors.black,
        ),
      ),

    );
  }
}
