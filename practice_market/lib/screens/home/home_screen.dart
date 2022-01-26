import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_market/models/product.dart';
import 'package:practice_market/screens/home/components/product_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('탭바', style: TextStyle(color: Colors.black)),
            SizedBox(width: 4),
            Icon(
              CupertinoIcons.chevron_down,
              size: 15,
              color: Colors.black,
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.search, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(CupertinoIcons.list_dash, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(CupertinoIcons.bell, color: Colors.black),
              onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(
            thickness: 0.5,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 0,
          indent: 16,
          endIndent: 16,
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          return ProductItem(product: productList[index]);
        },
        itemCount: productList.length,
      ),
    );
  }
}
