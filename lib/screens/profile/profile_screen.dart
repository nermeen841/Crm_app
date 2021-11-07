import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/authentication/controller/api.dart';
import 'package:crm_app/screens/profile/controller/update_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../test.dart';
import 'controller/get_profile_data.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var scafolldKey = GlobalKey<ScaffoldState>();

  late String textField;

  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafolldKey,
      drawer: drawer(context: context),
      appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text('الملف الشخصى', style: TextStyle(
              fontFamily: 'Cairo',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15
          ),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: ()=> scafolldKey.currentState!.openDrawer() ,
            child: Icon(Icons.more_horiz, color: Colors.black, size: 25,)),
        actions: [
          Image.asset('assets/images/avatar3 1.png', width: 30, height: 30,),
          InkWell(
              onTap:  ()=> Navigator.pop(context),
              child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 20,)),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, ),
          child: FutureBuilder(
            future: getProfileData(),
            builder: (context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ListView(
                  primary: true,
                  shrinkWrap: true,
                  children: [
                    buildProfileCard(context: context,icon:Icons.account_circle_rounded , title: 'الاسم',subTitle: "${snapshot.data['userDetails']["name"]}",),
                    myDivider(1),
                    buildPhoneProfileCard(context: context,title: 'رقم الهاتف',subTitle: "${snapshot.data['userDetails']["phone"]}",icon: Icons.phone),
                    myDivider(1),
                    buildEmailProfileCard(context: context,icon: Icons.email,subTitle: "${snapshot.data['userDetails']["email"]}",title: 'البريد الالكتروني'),
                    myDivider(1),
                    buildPasswordProfileCard(context: context,title: 'كلمه المرور ',subTitle: '******',icon: Icons.lock),
                    myDivider(1),
                  ],
                );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            },
          )
        ),
      ),
    );
  }

  Widget buildProfileCard({
    context,
    required String title,
    required String subTitle,
    required IconData icon,
}) => Column(
    children: [
      SizedBox(
        height: 65,
        child: InkWell(
          onTap: (){
            addprofileBottomSheet(context: context, mainTitle: 'الإسم', initialText: subTitle);
          },
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.blueAccent,),
              SizedBox(
                width: 5,
              ),
              Text(title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold, fontFamily: 'Cairo'
                ),
              ),
              Spacer(),
              Text(subTitle, style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600, fontFamily: 'Cairo',
                color: HexColor('#676767'),),),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios, color: HexColor('#676767'), size: 17,),
            ],
          ),
        ),
      ),
    ],
  );

  Widget buildPhoneProfileCard({
    context,
    required String title,
    required String subTitle,
    required IconData icon,
  }) => Column(
    children: [
      SizedBox(
        height: 65,
        child: InkWell(
          onTap: (){
            addPhoneProfileBottomSheet(context: context, mainTitle: 'رقم الهاتف',initialText:subTitle );
          },
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.blueAccent,),
              SizedBox(
                width: 5,
              ),
              Text(title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold, fontFamily: 'Cairo'
                ),
              ),
              Spacer(),
              Text(subTitle, style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600, fontFamily: 'Cairo',
                color: HexColor('#676767'),),),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios, color: HexColor('#676767'), size: 17,),
            ],
          ),
        ),
      ),
    ],
  );



  Widget buildEmailProfileCard({
    context,
    required String title,
    required String subTitle,
    required IconData icon,
  }) => Column(
        children: [
          SizedBox(
            height: 65,
            child: InkWell(
              onTap: () {
                addEmailProfileBottomSheet(context: context,
                    mainTitle: 'البريد الاكتروني',
                    initialText: subTitle);
              },
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 25,
                    color: Colors.blueAccent,),
                  SizedBox(
                    width: 5,
                  ),
                  Text(title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold, fontFamily: 'Cairo'
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 150,
                    child: Text(subTitle,
                      maxLines: 2,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600, fontFamily: 'Cairo',
                        color: HexColor('#676767'),),),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_forward_ios, color: HexColor('#676767'),
                    size: 17,),
                ],
              ),
            ),
          ),
        ],
      );

  Widget buildPasswordProfileCard({
    context,
    required String title,
    required String subTitle,
    required IconData icon,
  }) => Column(
    children: [
      SizedBox(
        height: 65,
        child: InkWell(
          onTap: (){
            addPasswordProfileBottomSheet(context: context, mainTitle: 'كلمه المرور');
          },
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.blueAccent,),
              SizedBox(
                width: 5,
              ),
              Text(title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold, fontFamily: 'Cairo'
                ),
              ),
              Spacer(),
              Text(subTitle, style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600, fontFamily: 'Cairo',
                color: HexColor('#676767'),),),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios, color: HexColor('#676767'), size: 17,),
            ],
          ),
        ),
      ),
    ],
  );

/////////////////////////////////////////////////////////////////////////


  profileTextfield({
    required TextInputType type,
    String? hint,
    required String initial,
    // double? height,
  }) {
    return Container(
      // height: height,
      padding: EdgeInsets.symmetric( horizontal: 5),
      color: Colors.white,
      child:
      ListView(
        primary: true,
        shrinkWrap: true,
        children: [
          TextFormField(
            keyboardType: type,
              initialValue:initial,
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
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color:HexColor('#333333'),fontSize: 15,fontFamily: 'Cairo'),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#E6E6E6")),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#E6E6E6")),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#E6E6E6")),
                ),
              )),
        ],
      ),
    );
  }




  void addprofileBottomSheet({
    @required context,
    required String mainTitle,
    required String initialText,
  }){
    showModalBottomSheet(
      backgroundColor: Colors.white,
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15))),
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(30)  ,topRight: Radius.circular(30) ,)
        builder: (context){
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                primary: true,
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 140),
                          child: Row(
                            children: [
                              Text(
                                mainTitle,
                                style: TextStyle(
                                    color: HexColor('#3E5481'),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),),
                              Spacer(),
                              Icon(Icons.clear,size: 25,color: Colors.black,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      profileTextfield(type: TextInputType.name,hint:"",initial: '$initialText'),
                      SizedBox(height: 50,),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#2972B7'),
                          ),
                          // height: 25,
                          width: 130,
                          child: TextButton(onPressed: (){
                            updateData(email: '',context: context,phone: '',name: textField,password: '',username: '');
                          },
                            child: Text('تأكيد',style: TextStyle(
                                fontFamily: 'Cairo',fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                            ),),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }



  void addPhoneProfileBottomSheet({
    @required context,
    required String mainTitle,
    required String initialText,

  }){
    showModalBottomSheet(
      isDismissible: true,
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15))),
        builder: (context){
          return Padding(
            padding:MediaQuery.of(context).viewInsets,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                primary: true,
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 110),
                          child: Row(
                            children: [
                              Text(
                                mainTitle,
                                style: TextStyle(
                                    color: HexColor('#3E5481'),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),),
                              Spacer(),
                              Icon(Icons.clear,size: 25,color: Colors.black,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      profileTextfield(type: TextInputType.phone,hint:"",initial: '$initialText'),
                      SizedBox(height: 50,),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#2972B7'),
                          ),
                          // height: 25,
                          width: 130,
                          child: TextButton(onPressed: (){
                            if(textField.length == 11){
                              updateData(email: '',context: context,phone: textField,name: '',password: '',username: '');
                            }else{
                              showAlertDialog(title: 'رقم الهاتف غير صحيح',context: context);
                            }
                            }, child: Text('تأكيد',style: TextStyle(
                              fontFamily: 'Cairo',fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                          ),),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  void addEmailProfileBottomSheet({
    @required context,
    required String mainTitle,
    required String initialText,
  }){
    showModalBottomSheet(
        isDismissible: true,
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15))),
        builder: (context){
          return Padding(
            padding:MediaQuery.of(context).viewInsets,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                primary: true,
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 110),
                          child: Row(
                            children: [
                              Text(
                                mainTitle,
                                style: TextStyle(
                                    color: HexColor('#3E5481'),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),),
                              Spacer(),
                              Icon(Icons.clear,size: 25,color: Colors.black,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      profileTextfield(type: TextInputType.emailAddress,hint:"",initial: '$initialText'),
                      SizedBox(height: 50,),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#2972B7'),
                          ),
                          // height: 25,
                          width: 130,
                          child: TextButton(onPressed: (){

                              updateData(email: textField,context: context,phone: '',name: '',password: '',username: '');

                          }, child: Text('تأكيد',style: TextStyle(
                              fontFamily: 'Cairo',fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                          ),),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  void addPasswordProfileBottomSheet({
    @required context,
    required String mainTitle,
  }){
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15))),
        builder: (context){
          return Padding(
            padding:MediaQuery.of(context).viewInsets,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Row(
                            children: [
                              Text(
                                mainTitle,
                                style: TextStyle(
                                    color: HexColor('#3E5481'),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),),
                              Spacer(),
                              Icon(Icons.clear,size: 25,color: Colors.black,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                  Container(
                    // height: height,
                    padding: EdgeInsets.symmetric( horizontal: 5),
                    color: Colors.white,
                    child:
                    ListView(
                      primary: true,
                      shrinkWrap: true,
                      children: [
                        TextFormField(
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
                            decoration: InputDecoration(
                              hintText: ' كلمه المرور الجديدة',
                              hintStyle: TextStyle(color:HexColor('#333333'),fontSize: 15,fontFamily: 'Cairo'),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexColor("#E6E6E6")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexColor("#E6E6E6")),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexColor("#E6E6E6")),
                              ),
                            )),
                      ],
                    ),
                  ),
                      SizedBox(height: 20,),
                      Container(
                        // height: height,
                        padding: EdgeInsets.symmetric( horizontal: 5),
                        color: Colors.white,
                        child:
                        ListView(
                          primary: true,
                          shrinkWrap: true,
                          children: [
                            TextFormField(
                              obscureText: true,
                                keyboardType: TextInputType.text,
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
                                decoration: InputDecoration(
                                  hintText: 'تأكيد كلمه المرور الجديدة',
                                  hintStyle: TextStyle(color:HexColor('#333333'),fontSize: 15,fontFamily: 'Cairo'),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: HexColor("#E6E6E6")),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: HexColor("#E6E6E6")),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: HexColor("#E6E6E6")),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#2972B7'),
                          ),
                          // height: 25,
                          width: 130,
                          child: TextButton(onPressed: (){
                            if(textField == confirmPassword){
                              updateData(email: '',context: context,phone: '',name: '',password: textField,username: '');
                            }else{
                              showAlertDialog(context: context,title: 'كلمه المرور غير متطابقة');
                            }
                            }, child: Text('تأكيد',style: TextStyle(
                              fontFamily: 'Cairo',fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                          ),),),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
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

