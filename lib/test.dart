// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// //
// // class PhoneAuthForm extends StatefulWidget {
// //   PhoneAuthForm({Key? key}) : super(key: key);
// //
// //   @override
// //   _PhoneAuthFormState createState() => _PhoneAuthFormState();
// // }
// //
// // class _PhoneAuthFormState extends State<PhoneAuthForm> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //   TextEditingController phoneNumber = TextEditingController();
// //   TextEditingController otpCode = TextEditingController();
// //
// //   // OutlineInputBorder border = OutlineInputBorder(
// //   //     borderSide: BorderSide(color: Constants.kBorderColor, width: 3.0));
// //
// //   bool isLoading = false;
// //
// //   String? verificationId;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery
// //         .of(context)
// //         .size;
// //     return Scaffold(
// //         appBar: AppBar(title: Text("Verify OTP"),
// //           backwardsCompatibility: false,
// //           systemOverlayStyle: SystemUiOverlayStyle(
// //               statusBarColor: Colors.blue),),
// //         backgroundColor: Colors.white,
// //         body: Center(
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   width: size.width * 0.8,
// //                   child: TextFormField(
// //                       keyboardType: TextInputType.phone,
// //                       controller: phoneNumber,
// //                       decoration: InputDecoration(
// //                         labelText: "Enter Phone",
// //                         contentPadding: EdgeInsets.symmetric(
// //                             vertical: 15.0, horizontal: 10.0),
// //                         // border: border,
// //                       )),
// //                 ),
// //                 SizedBox(
// //                   height: size.height * 0.01,
// //                 ),
// //                 SizedBox(
// //                   width: size.width * 0.8,
// //                   child: TextFormField(
// //                     keyboardType: TextInputType.number,
// //                     controller: otpCode,
// //                     obscureText: true,
// //                     decoration: InputDecoration(
// //                       labelText: "Enter Otp",
// //                       contentPadding: EdgeInsets.symmetric(
// //                           vertical: 15.0, horizontal: 10.0),
// //                       // border: border,
// //                       suffixIcon: Padding(
// //                         child: Icon(
// //                             Icons.remove_red_eye_outlined,
// //                             size: 15,
// //                         ),
// //                         padding: EdgeInsets.only(top: 15, left: 15),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
// //                 !isLoading
// //                     ? SizedBox(
// //                   width: size.width * 0.8,
// //                   child: OutlinedButton(
// //                     onPressed: () async {
// //                       // FirebaseService service = new FirebaseService();
// //                       if (_formKey.currentState!.validate()) {
// //                         setState(() {
// //                           isLoading = true;
// //                         });
// //                         await phoneSignIn(phoneNumber: phoneNumber.text);
// //                       }
// //                     },
// //                     child: Text('Constants.textSignIn'),
// //                     style: ButtonStyle(
// //                         // foregroundColor: MaterialStateProperty.all<Color>(Constants.kPrimaryColor),
// //                         // backgroundColor: MaterialStateProperty.all<Color>(Constants.kBlackColor),
// //                         side: MaterialStateProperty.all<BorderSide>(
// //                             BorderSide.none)),
// //                   ),
// //                 )
// //                     : CircularProgressIndicator(),
// //               ],
// //             ),
// //           ),
// //         ));
// //   }
// //   Future<void> phoneSignIn({required String phoneNumber}) async {
// //     await _auth.verifyPhoneNumber(
// //         phoneNumber: phoneNumber,
// //         verificationCompleted: _onVerificationCompleted,
// //         verificationFailed: _onVerificationFailed,
// //         codeSent: _onCodeSent,
// //         codeAutoRetrievalTimeout: _onCodeTimeout);
// //   }
// //
// //   _onVerificationCompleted(PhoneAuthCredential authCredential) async {
// //     print("verification completed ${authCredential.smsCode}");
// //     User? user = FirebaseAuth.instance.currentUser;
// //     setState(() {
// //       this.otpCode.text = authCredential.smsCode!;
// //     });
// //     if (authCredential.smsCode != null) {
// //       try{
// //         UserCredential credential =
// //         await user!.linkWithCredential(authCredential);
// //       }on FirebaseAuthException catch(e){
// //         if(e.code == 'provider-already-linked'){
// //           await _auth.signInWithCredential(authCredential);
// //         }
// //       }
// //       setState(() {
// //         isLoading = false;
// //       });
// //       // Navigator.pushNamedAndRemoveUntil(
// //       //     context, Constants.homeNavigate, (route) => false);
// //     }
// //   }
// //
// //   _onVerificationFailed(FirebaseAuthException exception) {
// //     if (exception.code == 'invalid-phone-number') {
// //       showMessage("The phone number entered is invalid!");
// //     }
// //   }
// //
// //   _onCodeSent(String verificationId, int? forceResendingToken) {
// //     this.verificationId = verificationId;
// //     print(forceResendingToken);
// //     print("code sent");
// //   }
// //
// //   _onCodeTimeout(String timeout) {
// //     return null;
// //   }
// //
// //   void showMessage(String errorMessage) {
// //     showDialog(
// //         context: context,
// //         builder: (BuildContext builderContext) {
// //           return AlertDialog(
// //             title: Text("Error"),
// //             content: Text(errorMessage),
// //             actions: [
// //               TextButton(
// //                 child: Text("Ok"),
// //                 onPressed: () async {
// //                   Navigator.of(builderContext).pop();
// //                 },
// //               )
// //             ],
// //           );
// //         }).then((value) {
// //       setState(() {
// //         isLoading = false;
// //       });
// //     });
// //   }
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sms_autofill/sms_autofill.dart';
//
// class MyLoginPage extends StatefulWidget {
//   @override
//   _MyLoginPageState createState() => _MyLoginPageState();
// }
//
// class _MyLoginPageState extends State<MyLoginPage> {
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SmsAutoFill smsAutoFill = SmsAutoFill();
//   String strVerificationId;
//   final globalKey = GlobalKey<ScaffoldState>();
//   TextEditingController phoneNumEditingController = TextEditingController();
//   TextEditingController smsEditingController = TextEditingController();
//   bool showVerifyNumberWidget = true;
//   bool showVerificationCodeWidget = false;
//   bool showSuccessWidget = false;
//
//   @override
//   void initState() {
//     super.initState();
//     getCurrentNumber();
//   }
//
//   getCurrentNumber() async {
//     phoneNumEditingController.text = await smsAutoFill.hint;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Firebase Phone Authentication Sample'),
//         ),
//         key: globalKey,
//         resizeToAvoidBottomPadding: false,
//         body: Center(
//           child: Padding(
//               padding: EdgeInsets.all(40),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   if(showVerifyNumberWidget) TextFormField(
//                     controller: phoneNumEditingController,
//                     decoration: const InputDecoration(
//                         labelText: 'Enter Phone number'),
//                     keyboardType: TextInputType.number,
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   if(showVerifyNumberWidget) Container(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     alignment: Alignment.center,
//                     child: RaisedButton(
//                       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                       color: Colors.pinkAccent,
//                       child: Text("Verify Number", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
//                       onPressed: () async {
//                         phoneNumberVerification();
//                       },
//                     ),
//                   ),
//                   if(showVerificationCodeWidget) TextFormField(
//                     controller: smsEditingController,
//                     decoration: const InputDecoration(labelText: 'Verification code'),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   if(showVerificationCodeWidget) Container(
//                     padding: const EdgeInsets.only(top: 16.0),
//                     alignment: Alignment.center,
//                     child: RaisedButton(
//                         color: Colors.pinkAccent,
//                         onPressed: () async {
//                           signInWithPhoneNumber();
//                         },
//                         child: Text("Sign in", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white))
//                     ),
//                   ),
//                   if(showSuccessWidget) Text('You are successfully logged in!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
//                 ],
//               )),
//         ));
//   }
//
//   // Future<void> phoneNumberVerification() async {
//   //
//   //   PhoneVerificationCompleted phoneVerificationCompleted =
//   //       (PhoneAuthCredential phoneAuthCredential) async {
//   //     await firebaseAuth.signInWithCredential(phoneAuthCredential);
//   //     displayMessage(
//   //         "Phone number is automatically verified and user signed in: ${firebaseAuth.currentUser.uid}");
//   //     setState(() {
//   //       showVerifyNumberWidget = false;
//   //       showVerificationCodeWidget = false;
//   //       showSuccessWidget = true;
//   //     });
//   //   };
//   //
//   //   PhoneVerificationFailed phoneVerificationFailed =
//   //       (FirebaseAuthException authException) {
//   //     displayMessage('Phone number verification is failed. Code: ${authException.code}. Message: ${authException.message}');
//   //   };
//   //
//   //   PhoneCodeSent phoneCodeSent =
//   //       (String verificationId, [forceResendingToken]) async {
//   //     displayMessage('Please check your phone for the verification code.');
//   //     strVerificationId = verificationId;
//   //     setState(() {
//   //       showVerifyNumberWidget = false;
//   //       showVerificationCodeWidget = true;
//   //     });
//   //   };
//   //
//   //   PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
//   //       (String verificationId) {
//   //     displayMessage("verification code: " + verificationId);
//   //     strVerificationId = verificationId;
//   //     setState(() {
//   //       showVerifyNumberWidget = false;
//   //       showVerificationCodeWidget = true;
//   //     });
//   //   };
//   //
//   //   try {
//   //     await firebaseAuth.verifyPhoneNumber(
//   //         phoneNumber: phoneNumEditingController.text,
//   //         timeout: const Duration(seconds: 5),
//   //         verificationCompleted: phoneVerificationCompleted,
//   //         verificationFailed: phoneVerificationFailed,
//   //         codeSent: phoneCodeSent,
//   //         codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
//   //   } catch (e) {
//   //     displayMessage("Failed to Verify Phone Number: ${e}");
//   //   }
//   // }
//
//   void displayMessage(String message) {
//     globalKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   void signInWithPhoneNumber() async {
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: strVerificationId,
//         smsCode: smsEditingController.text,
//       );
//
//       final User? user = (await firebaseAuth.signInWithCredential(credential)).user;
//
//       displayMessage("Successfully signed in UID: ${user!.uid}");
//
//       setState(() {
//         showVerificationCodeWidget = false;
//         showSuccessWidget = true;
//       });
//     } catch (e) {
//       displayMessage("Failed to sign in: " + e.toString());
//     }
//   }
// }