import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class NotificationFound extends StatelessWidget {


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



  @override
  Widget build(BuildContext context) {

    List<Widget> dismiss = [
      buildNotification(),
      buildNotification(),
      buildNotification(),
    ];
    showAlertDialog(BuildContext context) {
      Widget okButton =  Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Image.asset('assets/images/icons8-delete-200 1.png',width: 150,height: 150,),
            ),
          ),
          Center(child: Text('تأكيد الحذف',style: TextStyle(fontFamily: 'Cairo',fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                        color: HexColor('#E6E6E6'),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          'تأكيد',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )))),
                Spacer(),
                Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                        color: HexColor('#C50B0B'),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: Text(
                            'الغاء',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 15,
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
        actions: [
          okButton
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    var scafolldKey = GlobalKey<ScaffoldState>();

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
        backgroundColor: Colors.white,
        drawer: drawer(context: context) ,
        key: scafolldKey,
        appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text('الإشعارات', style: TextStyle(
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
          child: ListView.separated(
              itemBuilder: (context,index) => Dismissible(
                  confirmDismiss: (DismissDirection direction) async{
                    await  showAlertDialog(context);
                  },
                  key: Key(dismiss[index].toString()),
                  background: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.delete, color: HexColor('#C50B0B'),size:30 ,))),

                  child: dismiss[index]) ,
              separatorBuilder: (context,index) => SizedBox(height: 2,),
              itemCount: dismiss.length),
        )
    );
  }

  Widget buildNotification() => Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: HexColor('#E8EFFE'),
            child: Row(
              children: [
                SizedBox(
                  width: 270,
                  child: Text(
                    ' هناك حقيقة مثبتة منذو زمن طويل وهي ان المحتوي هناك حقيقة مثبتة منذو زمن طويل وهي ان المحتوي',
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '19 Aug',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: "Cairo"),
                )
              ],
            ),
          ),
        ],
      );
}
