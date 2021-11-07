import 'package:flutter/material.dart';

import 'body.dart';

class SignInScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Sign In (1).png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SignInBody(),
      ),
    );

  }
}
