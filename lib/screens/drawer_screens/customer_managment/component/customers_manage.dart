import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

import 'component.dart';
import 'controller/get_followups_api.dart';

class CustomerManageEditing extends StatefulWidget {

  final String name;
  final String email;
  final String phone;
  final String state;
  final String clientId;
  final String referral;
  final String contactingDateTime;
  final String contactingTime;
  final String notes;
  final String reviewOfferResponse;
  /* String? contactingDateTime,
   String? contactingTime,
   String? notes,
   String? reviewOfferResponse,*/

  const CustomerManageEditing(
      {Key? key,

      required this.name,
      required this.email,
      required this.phone,
      required this.state,
      required this.clientId,
      required this.referral,
      required this.contactingDateTime,
      required this.contactingTime,
      required this.notes,
      required this.reviewOfferResponse})
      : super(key: key);

  @override
  _CustomerManageEditingState createState() => _CustomerManageEditingState();
}

class _CustomerManageEditingState extends State<CustomerManageEditing> {
  var renderOverlay = true;

  var visible = true;

  var switchLabelPosition = false;

  var extend = false;

  var rmicons = false;

  var customDialRoot = false;

  var closeManually = false;

  var useRAnimation = false;

  var isDialOpen = ValueNotifier<bool>(false);

  var speedDialDirection = SpeedDialDirection.Up;

  var selectedfABLocation = FloatingActionButtonLocation.endDocked;

  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];

  var scafolldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10,right: 10),
        child: SpeedDial(
          overlayColor: Colors.white,
          backgroundColor: HexColor("#FFAE48"),
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          openCloseDial: isDialOpen,
          childPadding: EdgeInsets.all(10),
          spaceBetweenChildren: 4,
          dialRoot: customDialRoot
              ? (ctx, open, toggleChildren) {
            return ElevatedButton(
              onPressed: toggleChildren,
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding:
                EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              ),
              child: Text(
                "Custom Dial Root",
                style: TextStyle(fontSize: 17),
              ),
            );
          }
              : null,
          buttonSize: 56,
          label: extend ? Text("Open") : null,

          activeLabel: extend ? Text("Close") : null,
          childrenButtonSize: 56.0,
          visible: visible,
          direction: speedDialDirection,
          switchLabelPosition: switchLabelPosition,
          closeManually: closeManually,
          renderOverlay: renderOverlay,
          // onOpen: () => print('OPENING DIAL'),
          // onClose: () => print('DIAL CLOSED'),
          useRotationAnimation: useRAnimation,
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          elevation: 0.0,
          isOpenOnStart: false,
          animationSpeed: 200,

          childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [

            SpeedDialChild(
              labelStyle:TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
              child: !rmicons ? Icon(Icons.check_circle_outline_outlined) : null,
              backgroundColor: Colors.white,
              labelBackgroundColor:  HexColor('#2972B7'),
              foregroundColor: HexColor('#2972B7'),
              label: 'مهمة جديدة',
              onTap: () {},
            ),
            SpeedDialChild(

              labelStyle:TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
              child: !rmicons ? Image.asset('assets/images/Vector111.png',) : null,
              backgroundColor: Colors.white,
              labelBackgroundColor:  HexColor('#2972B7'),
              foregroundColor: HexColor('#2972B7'),
              label: 'عميل جديد',
              onTap: () {
                print('عميل جديد');
              },
            ),
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: drawer(context: context),
      key: scafolldKey,
      appBar: AppBar(
      elevation: 1,
      title: Center(
        child: Text('ادارة العملاء', style: TextStyle(
            fontFamily: 'Cairo',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15
        ),),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: InkWell(
          onTap: ()=> scafolldKey.currentState!.openDrawer(),
          child: Icon(Icons.more_horiz,color: Colors.black,size: 25,)),
      actions: [
        Image.asset('assets/images/avatar3 1.png',width: 30,height: 30,),
        SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black)),
      ],
    ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        /*
        *  child: FutureBuilder(
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
                return Center(child: CircularProgressIndicator(),);*/
        child: FutureBuilder(
            future: getFollowUps(context, widget.clientId),
            builder: (context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
               return ListView.builder(
                  shrinkWrap: true,
                  primary: true,
                 itemBuilder: (context, index) =>   Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     buildCustomerManagementCard(
                       context: context,
                     clientName: snapshot.data[index]['ClientDetails']['Name'],
                      cellPhone: snapshot.data[index]['ClientDetails']['cellphone'],
                       whatsPhone: snapshot.data[index]['ClientDetails']['whatsapp'],
                     contactingTime: snapshot.data[index]['contactingTime'],
                     clientState: (snapshot.data[index]['ClientDetails']['status'] == null)? snapshot.data[index]['ClientDetails']['status'] : null,
                       //
                       // referral: (widget.referral == null) ? widget.referral : null,
                       //
                       // clientState: (widget.state == null) ? widget.state : null,
                       //
                       // cellPhone: widget.phone,
                       //
                       // id: widget.clientId,
                       //
                       // email:  (widget.email == null) ? widget.email : null,
                       //
                       // clientName: widget.name,
                     ),

                     myDivider(3),
                     Container(
                       padding: EdgeInsets.only(right: 15,top: 10),
                       child:
                       (widget.reviewOfferResponse != 'null') ?Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('اهتمام العميل',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                               fontSize: 13,
                               fontFamily: 'Cairo',
                             ),),
                           SizedBox(
                             height: 20,
                           ),
                           Container(
                             padding: EdgeInsets.only(right: 30),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   '${ snapshot.data[index]['offerResponse']}',
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 13,
                                     fontFamily: 'Cairo',
                                   ),),
                                 // SizedBox(
                                 //   height: 10,
                                 // ),
                                 // Text('-اسم الخدمه',
                                 //   style: TextStyle(
                                 //     color: Colors.black,
                                 //     fontSize: 13,
                                 //     fontFamily: 'Cairo',
                                 //   ),),
                                 // SizedBox(
                                 //   height: 10,
                                 // ),
                                 // Text('-اسم المشروع',
                                 //   style: TextStyle(
                                 //     color: Colors.black,
                                 //     fontSize: 13,
                                 //     fontFamily: 'Cairo',
                                 //   ),),
                                 SizedBox(
                                   height: 20,
                                 ),
                                 myDivider(3),
                               ],
                             ),
                           ),
                         ],
                       ) : Container(),

                     ),
                     (widget.notes != 'null') ?
                     Container(
                       padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('ملاحظه',style: TextStyle(
                               fontFamily: 'Cairo',
                               fontSize: 13,
                               fontWeight: FontWeight.bold,
                               color: Colors.black
                           ),),
                         // snapshot.data[index]['Notes']
                           Text(
                             '${snapshot.data[index]['Notes'].toString()}',
                             // maxLines: 2,
                             style: TextStyle(
                                 fontFamily: 'Cairo',
                                 fontSize: 13,
                                 color: Colors.black
                             ),)
                         ],
                       ),) : Container(),
                     SizedBox(height: 15,),
                      buildCustomerManageData(
                          context: context,
                          firstTime: "${snapshot.data[index]['contactingDateTime']}",
                          // whoIsContactTime: '${snapshot.data[index]['whoIsContacting']}',
                          lastTime:  snapshot.data[index]['contactingTime'],
                      ),
                      // buildCustomerManageData(
                      //     context: context,
                      //   firstTime: "${snapshot.data[index]['contactingDateTime']}",
                      //   // whoIsContactTime: '${snapshot.data[index]['whoIsContacting']}',
                      //   lastTime:  "${snapshot.data[index]['contactingDateTime']}",
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                 ),
                 itemCount: snapshot.data.length,
                );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            }
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildCustomerManageData({
    context,
    String? firstTime,
    String? lastTime,
    String?  whoIsContactTime,

  }) => InkWell(
    onTap: () {
      // showOptionsDealAlertDialog(context: context,title: 'هل أنت متأكد من خسارة التعاقد ونقل العميل الي الأرشيف!',path: 'assets/images/icons8-trash-200 1.png');
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      height: 106,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today,color: Colors.black,size: 20,),
                      SizedBox(width: 5,),
                      Text(
                        '$firstTime'.substring(0,19),
                        style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      ),),
                      SizedBox(width: 40,),
                    Text('$lastTime', style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),),
                      SizedBox(width: 30,),
                      // Icon(Icons.phone_callback,color: Colors.black,size: 20,),
                      // SizedBox(width: 5,),
                      // Text(
                      //   '$whoIsContactTime'
                      //   ,style: TextStyle(color: Colors.black,
                      //   fontWeight: FontWeight.bold,
                      //   fontFamily: 'Cairo',
                      //   fontSize: 13,
                      // ),)
                    ],

                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 280,
                    child: Text(
                      'هو ببساطه نص شكلي (بعمني ان الغابه هي الشكل وليس المحتوي )',
                      // maxLines: 2,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          color: Colors.black
                      ),),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    ),
  );
}
