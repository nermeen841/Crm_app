import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/screens/splash/splashScreen.dart';
import 'package:crm_app/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //طالما ان ال void main  بقت async وفيها ميثود  await  فلازم هنه ال Widget دي
  await Firebase.initializeApp();

  // await FCMConfig.instance.init();
  // final token = await FCMConfig.messaging.getToken();
  // SharedPreferences _Sp = await SharedPreferences.getInstance();
  // _Sp.setString('firebaseToken', '$token');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child:  Splash()),
      ),
    );
  }
}

