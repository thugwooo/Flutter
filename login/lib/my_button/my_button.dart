import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    this.image,
    this.text,
    this.color,
    this.radius,
    this.onPressed,
  });
  final Widget? image;
  final Widget? text;
  final Color? color;
  final double? radius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            image!,
            text!,
            Opacity(
              opacity: 0,
              child: image!,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: onPressed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius!),
        ),
      ),
    );
  }
}
