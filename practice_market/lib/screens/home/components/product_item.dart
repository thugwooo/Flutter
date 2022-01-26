import 'package:flutter/material.dart';
import 'package:practice_market/models/product.dart';
import 'package:practice_market/screens/home/components/product_detail.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.urlToImage,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          ProductDetail(product: product),
        ],
      ),
    );
  }
}
