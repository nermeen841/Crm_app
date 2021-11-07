import 'dart:async';
import 'package:crm_app/screens/authentication/first_login_screen/first_login_screen.dart';
import 'package:crm_app/screens/authentication/signIn/SignInScreen.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:crm_app/screens/onBoarding/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'body.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

Widget screen = OnBoardingScreen();

getScreen() async{
  SharedPreferences _sp = await SharedPreferences.getInstance();
  final onboard = _sp.getBool('onBoarding');
  final auth = _sp.getBool('login');
  if(onboard == true){
    if(auth == true){
      setState(() {
        screen = CrmAppLayout(index: 0,);
      });
    }else{
      setState(() {
        screen = SignInScreen();
      });
    }
  }else{
    setState(() {
      screen = OnBoardingScreen();
    });
  }
}

  @override
  void initState() {
  this.getScreen();
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => screen)));
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash.png"),
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
        body: SplashBody(),
      ),
    );
  }
}
