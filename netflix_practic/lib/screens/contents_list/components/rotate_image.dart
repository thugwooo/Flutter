import 'package:flutter/material.dart';

class RotateImage extends StatelessWidget {
  final String imageUrl;
  final int degree;
  RotateImage({required this.imageUrl, required this.degree});
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: degree * 3.14 / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image(
          image: AssetImage(imageUrl),
          height: 150,
        ),
      ),
    );
  }
}
