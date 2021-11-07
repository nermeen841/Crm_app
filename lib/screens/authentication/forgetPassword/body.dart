import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/authentication/resetPassword/controller_api.dart';
import 'package:crm_app/screens/authentication/resetPassword/resetPasswordScreen.dart';
import 'package:crm_app/screens/send_code/pin_code_for_resetPassword.dart';
import 'package:crm_app/screens/send_code/pin_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBody extends StatefulWidget {

  static late String ID = '';
  static TextEditingController? phoneController =TextEditingController() ;

  @override
  _ForgetPasswordBodyState createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  // var phoneController = TextEditingController();

late String verificationId;

  Future<void> _verifyPhone() async {
    print('this phone is: ${ForgetPasswordBody.phoneController!.text}');
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verId) {
      this.verificationId = verId;
      // Navigator.push(context, MaterialPageRoute(builder: (context) => PinCodeResetPasswordVerificationScreen(
      //               phoneNumber: '${phoneController.text.toString()}',
      //               verificationId: verificationId,
      //               press: () => Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => ResetPasswordScreen())),
      //             )));
      setState(() {
        ForgetPasswordBody.ID = verificationId;
      });
      print("ccccccccccccccccccccccccccccccccccccccccccccccccccc : $verificationId");
    };

    final void Function(String verId, [int? forceCodeResend]) codeSent =
        (String verId, [int? forceCodeResend]) {
      this.verificationId = verId;
      // Navigator.push(context, MaterialPageRoute(builder: (context)
      // => PinCodeResetPasswordVerificationScreen(phoneNumber: '${phoneController.text.toString()}',press: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen())), verificationId: verificationId,)));
          setState(() {
            ForgetPasswordBody.ID = verificationId;
          });
    };

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential user) {
      print('the user data is: $user');
    };

    final PhoneVerificationFailed verificationFailed =
        (exception) => print('${exception.message}');

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+2" + ForgetPasswordBody.phoneController!.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              child: Text(
                'Forgot password?',
                maxLines: 3,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    height: 1.1,
                    color: HexColor('#2972B7'),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // width: 317,
                height: 55,
                decoration: BoxDecoration(
                    color: HexColor('#E6E6E6'),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: ForgetPasswordBody.phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'The Email address Must Not Be Empty ';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.phone,
                      color: HexColor('#626262'),
                      size: 24,
                    ),
                    hintText: 'Enter Your Phone Number',
                    labelStyle: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: HexColor(
                          '#626262',
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 282,
              child: Text(
                '* We will send you a message to set or reset your new password',
                style: TextStyle(
                  color: HexColor('#676767'),
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Send code',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    sendResetPass(
                        context: context,
                        phone: ForgetPasswordBody.phoneController!.text.toString());
                    _verifyPhone();

                  },
                  child: Image.asset(
                    'assets/images/Group.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}