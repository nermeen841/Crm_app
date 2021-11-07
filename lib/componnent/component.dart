
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:crm_app/screens/authentication/signIn/body.dart';
import 'package:crm_app/screens/bottom_navbar_screens/notificaton_screen.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/customer_managment_screen.dart';
import 'package:crm_app/screens/drawer_screens/notifications/notifications_found.dart';
import 'package:crm_app/screens/drawer_screens/units/all_units_screen.dart';
import 'package:crm_app/screens/real_estate/projects_details_screen.dart';
import 'package:crm_app/screens/drawer_screens/services/services_screen.dart';
import 'package:crm_app/screens/home/component/TabBar_screens/deatils_task_screen.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:crm_app/screens/profile/profile_screen.dart';
import 'package:crm_app/screens/real_estate/projects_screen.dart';
import 'package:crm_app/screens/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';




Widget defaultFormFiled({

  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  required VoidCallback validate,
  required String label,
  // @required IconData prefix,
  // required IconData suffix,
  // required VoidCallback suffixPressed,
  // bool isClickable = true,
}) =>
    TextFormField(

      // enabled: isClickable,
      //  validator: validate,
      controller: controller,
      keyboardType: type,
      // onTap: onTap,
      obscureText: isPassword,
      // onFieldSubmitted: onSubmit,
      // onChanged: onChange,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle( fontFamily: 'Noor',color: HexColor('#9EA6BE')),
        hoverColor: Colors.red,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor('EDF1F7'),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        // prefixIcon: Icon(
        //   prefix,
        // ),
        // suffixIcon: suffix != null
        //     ? IconButton(
        //   icon: Icon(suffix,color: HexColor('#C5CEE0'),),
        //   onPressed: suffixPressed,
        // )
        //     : null,
      ),
    );


Widget defaultButton({
   required double width,
   required double height,
  required Color background,
  bool isUpperCase = true,
  double radius = 0,
  required VoidCallback function,
  required String text,
}) =>
    MaterialButton(
      minWidth: width,
      height: height,
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: function,
      child: Text(text,style: TextStyle(

          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: "Cairo"
      ),),
    );


 navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);

Widget drawer({required context}) => Drawer(
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/menu1.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Container(
            width: double.infinity,
            height: 350,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 122,
                width: 122,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/3.png',)),
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 3,
                        offset: Offset(0,3)
                    )
                  ],
                ),

                // child: Center(child: Text('Logo',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: "Cairo"),)),
              
              ),
            ),
          )),
      Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.home,size: 20,color: HexColor('#2972B7'),),
                  SizedBox(
                    width: 20,
                  ),
                  Text('الرئيسية',style: TextStyle(fontFamily: 'Cairo',color: HexColor('#2972B7'),fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  CrmAppLayout(index: 0,),
                    ));
              },
            ),  
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.notifications,size: 20,color: HexColor('#2972B7'),),
                  SizedBox(
                    width: 20,
                  ),
                  Text('الاشعارات',style: TextStyle(fontFamily: 'Cairo',color: HexColor('#2972B7'),fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  CrmAppLayout(index: 1,),
                    ));
              },
            ),



            ListTile(
              title: Row(
                children: [
                  Image.asset('assets/images/trending_up.png',width: 20,height: 20,),
                  SizedBox(
                    width: 20,
                  ),
                  Text('المشروعات',style: TextStyle(fontFamily: 'Cairo',color: HexColor('#2972B7'),fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => ProjectScreen(),
                        ));
                  },
                ),


            ListTile(
              title: Row(
                children: [
                  Icon(Icons.bubble_chart,size: 20,color: HexColor('#2972B7'),),
                  SizedBox(
                    width: 20,
                  ),
                  Text('الوحدات',style: TextStyle(fontFamily: 'Cairo',color: HexColor('#2972B7'),fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllUnitScreen(),
                    ));
              },
            ),
            // ListTile(
            //   title: Row(
            //     children: [
            //       Icon(Icons.touch_app,size: 20,color: HexColor('#2972B7'),),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Text('الخدمات',style: TextStyle(fontFamily: 'Cairo',color: HexColor('#2972B7'),fontWeight: FontWeight.bold,fontSize: 18),)
            //     ],
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute<void>(
            //           builder: (BuildContext context) =>  ServicesScreen(),
            //         ));              },
            // ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.calendar_today,size: 20,color: HexColor('#2972B7'),),
                  SizedBox(
                    width: 20,
                  ),
                  Text('التقويم',style: TextStyle(fontFamily: 'Cairo',color: HexColor('#2972B7'),fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => CrmAppLayout(index: 3),
                    ));
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  // Icon(Icons.,size: 20,color: HexColor('#2972B7'),),
                  Image.asset('assets/images/Vector111.png',width: 20,height: 20,),
                  SizedBox(
                    width: 20,
                  ),
                  Text('ادارة العملاء',style: TextStyle(fontFamily: 'Cairo',color: HexColor('#2972B7'),fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  CustomerManagement(),
                    ));
              },
            ),
            SizedBox(
              height: 120,
            ),
            InkWell(
              onTap: ()async{
                AppCubit.get(context).isSignIn = false;
                SharedPreferences shared = await SharedPreferences.getInstance();
                shared.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Splash()));
              },
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 10),
                width: 133,
                height: 40,
                decoration: BoxDecoration(
                    color: HexColor('#2972B7'),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(child: Text('تسجيل الخروج',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('V 1.0',style: TextStyle(fontFamily: 'Cairo',fontSize: 14,fontWeight: FontWeight.bold,color: HexColor('#626262')),),
                  Spacer(),
                  Text('Powered by Technomasr',style: TextStyle(fontFamily: 'Cairo',fontSize: 14,fontWeight: FontWeight.bold,color: HexColor('#626262')),),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),

);


AppBar customeAppbar({ String? title,required VoidCallback press,context}){
  return AppBar(
    backgroundColor: Colors.white,
    title: Center(child: Text('$title',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "Cairo"),)),
    actions: [
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=> ProfileScreen()));
        },
        child: CircleAvatar(
          child: Image.asset('assets/images/avatar3 1.png',width: 30,height: 30,fit: BoxFit.cover,),
          backgroundColor: Colors.white,
        ),
      ),
    ],
    leading: InkWell(
        onTap: press,
        child: Image.asset('assets/images/Vector.png')),
    elevation: 0,
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


Widget myDivider(@required double height) => Container(
  width: double.infinity,
  height: height,
  color: Colors.grey[300],);

var notesController = TextEditingController();

Widget buildDetailsTaskScreen() => Container(
  padding: EdgeInsets.only(right: 20,left: 20),
  child:  SingleChildScrollView(
    child: Column(
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'للعميل اجتماع مناقشة العرض المقدم للعميل اجتماع مناقشة العرض المقدم ', style: TextStyle(
          fontSize: 20,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
        ),
          maxLines: 2,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Icon(Icons.alarm,color: HexColor('#2972B7'),size: 20,),
            SizedBox(
              width: 5,
            ),
            Text('duedate',style: TextStyle(color: HexColor('#676767',),fontWeight: FontWeight.w300,fontFamily: 'Cairo'),),
            SizedBox(
              width: 15,
            ),
            Text('09:00 am',style: TextStyle(color: HexColor('#676767',),fontWeight: FontWeight.w300,fontFamily: 'Cairo',),)
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 216,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: HexColor('#DDEFFF')
            ),
            child: Text('أ/أحمد علي  0101044975860',style: TextStyle(color: Colors.black,fontFamily: 'Cairo',fontSize: 15),),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Align(
        //     alignment: Alignment.centerRight,
        //     child: Text('المشروع : مول ابراج - عبدلسلام عارف',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Cairo',fontSize: 14,color: Colors.black),)),
        // SizedBox(
        //   height: 20,
        // ),
        // Align(
        //     alignment: Alignment.centerRight,
        //     child: Text('الوحدة : محل تجاري دور تاني',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Cairo',fontSize: 14,color: Colors.black),)),
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Text('ملاحظات',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo',fontSize: 16,color: Colors.black),)),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            height: 140,
            width: 353,
            color: HexColor('#E6E6E6'),
            child: TextFormField(
              controller:notesController,
              maxLines: 4,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'كتابة ملاحظات',

              ),
              style: TextStyle(color: HexColor('#626262'),fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600),
              textDirection: TextDirection.rtl,
            )),
        SizedBox(
          height: 30,
        ),
        Container(
            width: 90,
            height: 45,
            decoration: BoxDecoration(
                color: HexColor('#2972B7'),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Center(child: Text('حفظ',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),))),
      ],
    ),
  ),
);


showAlertDialog({context,required VoidCallback press,required String path,required String title}) {
  Widget okButton = Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Image.asset(
            path,
            width: 150,
            height: 150,
          ),
        ),
      ),
      Center(
          child: Text(
          title,
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          )),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                    color: HexColor('#E6E6E6'),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: InkWell(
                        onTap: press,
                            // showSuccessAlertDialog(path: 'assets/images/icons8-delete-200 1.png',context: context,title: 'تم الحذف بنجاح',press: (){}),
                        child: Text(
                          'تأكيد',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )))),
            Spacer(),
            Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                    color: HexColor('#C50B0B'),
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Text(
                        'الغاء',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                )),
          ],
        ),
      ),
    ],
  );

  AlertDialog alert = AlertDialog(
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogCancel({context,required VoidCallback press,required String path,required String title}) {
  Widget okButton = Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Image.asset(
            path,
            width: 150,
            height: 150,
          ),
        ),
      ),
      Center(
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          )),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
                width: 100,
                height: 45,
                decoration: BoxDecoration(
                    color: HexColor('#E6E6E6'),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: InkWell(
                        onTap: press,
                        child: Text(
                          'تأكيد',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )))),
            Spacer(),
            Container(
                width: 100,
                height: 45,
                decoration: BoxDecoration(
                    color: HexColor('#C50B0B'),
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Text(
                        'الغاء',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                )),
          ],
        ),
      ),
    ],
  );

  AlertDialog alert = AlertDialog(
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget buildSearchText() => Container(
  padding: EdgeInsets.only(right: 10),
  height: 35,
  child: Row(
    textDirection: TextDirection.rtl,
    children: [
      Text(
        'محمد احمد علي',
        style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: HexColor('#626262')),
      ),
      SizedBox(
        width: 30,
      ),
      Text(
        '01001919985',
        style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: HexColor('#626262')),
      ),
    ],
  ),
);

//  'assets/images/99 1.png',
showSuccessAlertDialog({context, VoidCallback? press,required String path,required String title}) {
  Widget okButton = InkWell(
    onTap: press,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset(
              path,
              width: 220,
              height: 220,
            ),
          ),
        ),
        Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
  AlertDialog alert = AlertDialog(
    actions: [okButton],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showSearchAlertDialog(BuildContext context) {
  Widget okButton = Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    width: 311,
    height: 500,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor("#E6E6E6")),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'بحث',
                style: TextStyle(
                    color: HexColor('#626262'),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: HexColor('#626262'),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 400,
          child: ListView.separated(
            shrinkWrap: true,
            primary: true,
            itemBuilder: (context, index) => buildSearchText(),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: 15,
          ),
        ),
      ],
    ),
  );

  AlertDialog alert = AlertDialog(
    actions: [okButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




DoneTasksCard({
  context,
  required String notes,
  required String clientName,
  required String phone,
  required String status,
  required String contactingDateTime,
}){
   return InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTaskScreen(),
          ));
    },
    child: Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(width: 20),
                (notes == 'null') ? Container() :
                Text(
                  notes,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(width: 10),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: HexColor('#DDEFFF'),
                      borderRadius:
                      BorderRadius.circular(10)),
                  height: 30,
                  child: Text(
                    clientName,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
                // Spacer(),
                // Icon(Icons.more_vert),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.alarm,
                    color:HexColor('#2972B7'),
                    size: 20,
                  ),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                Text(
                  'duedate',
                  style: TextStyle(
                      fontFamily: "Cairo,",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#676767')),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  contactingDateTime.substring(0,10),
                  style: TextStyle(
                      fontFamily: "Cairo,",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#676767')),
                ),
                Spacer(),
                Text(
                  status,
                  style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#676767')),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}





