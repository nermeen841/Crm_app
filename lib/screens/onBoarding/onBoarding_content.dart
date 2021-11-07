import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final String text, image;

  const SplashContent({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: (357),
          width: (457),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
        ),
      ],
    );
  }
}
