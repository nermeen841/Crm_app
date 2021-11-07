import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:crm_app/screens/authentication/controller/api.dart';
import 'package:crm_app/screens/authentication/forgetPassword/forgetPasswordScreen.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:crm_app/screens/send_code/pin_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SignInScreen.dart';


class SignInBody extends StatefulWidget {

  static late String ID = '';
  static TextEditingController? phoneController;
  @override
  _SignInBodyState createState() => _SignInBodyState();
}


class _SignInBodyState extends State<SignInBody> {

  late String verificationId;

  TextEditingController? passwordController;
  final formKey = GlobalKey<FormState>();


  @override
  void initState() {
    SignInBody.phoneController = TextEditingController();
     passwordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _verifyPhone(context) async {
    print('this phone is: ${SignInBody.phoneController!.text}');
    final PhoneCodeAutoRetrievalTimeout verificationFaild = (String verId) {
      this.verificationId = verId;
      setState(() {
        SignInBody.ID = verificationId;
      });
      // Navigator.push(context, MaterialPageRoute(builder: (context)
      // => PinCodeVerificationScreen
      //   (phoneNumber: '${phoneController!.text.toString()}',
      //   press: ()=>
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>CrmAppLayout(index: 0) )), verificationId: verificationId,)));
      // print("ccccccccccccccccccccccccccccccccccccccccccccccccccc : $verificationId");
    };

    final void Function(String verId, [int? forceCodeResend]) codeSent =
        (String verId, [int? forceCodeResend]) {
      this.verificationId = verId;
      setState(() {
        SignInBody.ID = verificationId;
      });
      // Navigator.push(context, MaterialPageRoute(builder: (context) => PinCodeVerificationScreen(
      //               phoneNumber: '${phoneController!.text.toString()}',
      //               press: () => Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => CrmAppLayout(index: 0))), verificationId: verificationId,
      //             )));
    };

    final PhoneVerificationCompleted verificationCompleted = (AuthCredential user) {print('the user data is: $user');};
    final PhoneVerificationFailed verificationFailed = (exception) => print('${exception.message}');
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+2" + SignInBody.phoneController!.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: verificationFaild);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  SignInBody.phoneController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            width: 350,
                            height: 60,
                            decoration: BoxDecoration(
                              color: HexColor('#E6E6E6'),
                              borderRadius:BorderRadius.circular(15),
                            ),

                            child: Align(
                        alignment: Alignment.center,
                           child: TextFormField(
                          controller: SignInBody.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            hintText: 'Your Phone',
                            hintStyle: TextStyle(
                                fontFamily: "Cairo",
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: HexColor(
                                  '#3C3C3C',
                                )),
                          ),
                        ),
                      ),
                    ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            width: 350,
                            height: 60,
                            decoration: BoxDecoration(
                              color: HexColor('#E6E6E6'),
                              borderRadius:BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintText: 'Password',
                                labelStyle: TextStyle(
                                    fontFamily: "Cairo",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w100,
                                    color: HexColor('#3C3C3C',)
                                ),
                              ) ,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPasswordScreen()));
                            },
                            child: Text('Forget Passwords !?',style: TextStyle(
                                fontFamily: 'Cairo',fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black
                            ),),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                            alignment:Alignment.bottomCenter ,
                            child:(AppCubit.get(context).isSignIn)?Container(child: Center(child: CircularProgressIndicator(),),) :
                            BlocConsumer<AppCubit, AppStates>(
                              listener: (context , state){
                              } ,
                              builder:(context , state){
                                return
                                  AppCubit.get(context).isSignIn ? CircularProgressIndicator():
                                  defaultButton(background: HexColor('#2972B7'), function: (){
                                    // if(formKey.currentState!.validate()){
                                    AppCubit.get(context).changeSignIn();
                                    AppCubit.get(context).changeFirstLogin();
                                    _verifyPhone(context);
                                    sendUserData(
                                      email: SignInBody.phoneController!.text,
                                      context: context,
                                      pass: passwordController!.text,
                                    );
                                  }, text: 'Sign In', width: 150,height: 40,radius: 10);
                              },
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}



