// import 'package:crm_app/componnent/component.dart';
// import 'package:crm_app/cubit/cubit.dart';
// import 'package:crm_app/cubit/states.dart';
// import 'package:crm_app/screens/authentication/controller/api.dart';
// import 'package:crm_app/screens/authentication/forgetPassword/forgetPasswordScreen.dart';
// import 'package:crm_app/screens/authentication/signIn/SignInScreen.dart';
// import 'package:crm_app/screens/send_code/pin_code_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class FirstLoginBody extends StatelessWidget {
//   var phoneController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//
//   late String verificationId;
//   Future<void> _verifyPhone(context) async {
//     print('this phone is: ${this.phoneController.text}');
//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verId) {
//       this.verificationId = verId;
//       Navigator.push(context, MaterialPageRoute(builder: (context) => PinCodeVerificationScreen(
//                     phoneNumber: '${phoneController.text.toString()}',
//                     press: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SignInScreen())),
//                   )));
//
//       print("ccccccccccccccccccccccccccccccccccccccccccccccccccc : $verificationId");
//     };
//
//     final void Function(String verId, [int? forceCodeResend]) codeSent =
//         (String verId, [int? forceCodeResend]) {
//       this.verificationId = verId;
//       Navigator.push(context, MaterialPageRoute(builder: (context) => PinCodeVerificationScreen(
//                     phoneNumber: '${phoneController.text.toString()}',
//                     press: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SignInScreen())),
//                   )));
//     };
//
//     final PhoneVerificationCompleted verificationCompleted =
//         (AuthCredential user) {
//       print('the user data is: $user');
//     };
//
//     final PhoneVerificationFailed verificationFailed =
//         (exception) => print('${exception.message}');
//
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: "+2" + this.phoneController.text,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 250),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               // mainAxisSize: MainAxisSize.max,
//               children: [
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
//                   child: Container(
//                     padding: EdgeInsets.only(left: 20),
//                     width: 350,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: HexColor('#E6E6E6'),
//                       borderRadius:BorderRadius.circular(15),
//                     ),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: TextFormField(
//                         controller: phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration:InputDecoration(
//                           border: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           disabledBorder: InputBorder.none,
//                           errorBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           focusedErrorBorder: InputBorder.none,
//                           hintText: 'Your Phone',
//                           labelStyle: TextStyle(
//                               fontFamily: "Cairo",
//                               fontSize: 18,
//                               fontWeight: FontWeight.w100,
//                               color: HexColor('#3C3C3C',)
//                           ),
//                         ) ,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: 20,
//                 // ),
//
//
//                 Align(
//                     alignment:Alignment.bottomCenter ,
//                     child:(AppCubit.get(context).isLoginIn)?Container(child: Center(child: CircularProgressIndicator(),),) :
//                     BlocConsumer<AppCubit, AppStates>(
//                       listener: (context , state){} ,
//                       builder:(context , state){
//                         return
//                           AppCubit.get(context).isLoginIn ? CircularProgressIndicator():
//                           defaultButton(background: HexColor('#2972B7'), function: (){
//                              AppCubit.get(context).changeFirstLogin();
//                             _verifyPhone(context);
//                             // sendUserData(
//                             //   email: phoneController.text.toString(),
//                             //   context: context,
//                             //   pass: passwordController.text.toString(),
//                             // );
//                           }, text: 'Login', width: 150,height: 40,radius: 10);
//                       },
//                     ))
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
