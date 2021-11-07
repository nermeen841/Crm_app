import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30
            ),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/3.png',)),
                  shape: BoxShape.circle,
                color: Colors.white
              ),
            ),
          ),
        ),

      ],
    );

  }
}
