import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/home/component/TabBar_screens/subTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class TasksScreenInDrawer extends StatelessWidget {

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
      key: scafolldKey,
      drawer: drawer(context: context),
      appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text('المهام', style: TextStyle(
              fontFamily: 'Cairo',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15
          ),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: ()=>scafolldKey.currentState!.openDrawer(),
            child: Icon(Icons.more_horiz,color: Colors.black,size: 25,)),
        actions: [
          Image.asset('assets/images/avatar3 1.png',width: 30,height: 30,),
          SizedBox(
            width: 10,
          ),
          // InkWell(
          //     onTap: (){
          //       Navigator.pop(context);
          //     },
          //     child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black)),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SubTabBar(),
      ),
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
    );
  }
}


