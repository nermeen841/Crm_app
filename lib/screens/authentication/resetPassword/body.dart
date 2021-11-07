import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/home/HomeScreen.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:crm_app/screens/profile/controller/update_data.dart';
import 'package:flutter/material.dart';

class ResetPasswordBody extends StatefulWidget {
  @override
  _ResetPasswordBodyState createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {

  var formKey = GlobalKey<FormState>();

  late String textField;

  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // primary: true,
          // shrinkWrap: true,
          children: [
            Container(
                width: 250,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                  'Forgot password?',
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      height: 1.1,
                      color: HexColor('#2972B7'),
                      fontSize: 40,
                      // height: 190,
                      fontWeight: FontWeight.bold
                  ),
                ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(left: 50),
                      height: 55,
                      decoration: BoxDecoration(
                          color: HexColor('#E6E6E6'),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        initialValue:'',
                        onChanged: (val){
                          setState(() {
                            textField =val;
                          });
                        },
                        onFieldSubmitted: (val){
                          setState(() {
                            textField =val;
                          });
                        },
                        // keyboardType: TextInputType.text,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          // prefixIcon: Icon(Icons.email,color: HexColor('#626262'),size: 24,),
                          hintText: 'Enter New Password',
                          labelStyle: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#676767',)
                          ),
                        ) ,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(left: 50),
                      height: 55,
                      decoration: BoxDecoration(
                          color: HexColor('#E6E6E6'),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        // keyboardType: TextInputType.text,
                        initialValue:'',
                        onChanged: (val){
                          setState(() {
                            confirmPassword =val;
                          });
                        },
                        onFieldSubmitted: (val){
                          setState(() {
                            confirmPassword =val;
                          });
                        },
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          // prefixIcon: Icon(Icons.email,color: HexColor('#626262'),size: 24,),
                          hintText: 'Confirm Password',
                          labelStyle: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#676767',)
                          ),
                        ) ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Align(
                alignment:Alignment.center ,
                child: defaultButton(background: HexColor('#2972B7'), function: ()
                {
                  if(textField == confirmPassword){
                    updateData(email: '',context: context,phone: '',name: '',password: confirmPassword,username: '');
                  }else{
                    showAlertDialog(context: context,title: 'كلمه المرور غير متطابقة');
                  }

                }, text: 'Sign In', width: 150,height: 40,radius: 10))
          ],
        ),
      ),
    );
  }
}

showAlertDialog({required title, context}){
  AlertDialog alert = AlertDialog(
    title: Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: ()=>Navigator.pop(context),
                child: Icon(Icons.close_outlined))),
        SizedBox(height: 25,),
        Center(child: Text(title)),
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
