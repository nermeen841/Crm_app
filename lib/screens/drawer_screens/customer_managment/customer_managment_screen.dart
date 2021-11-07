import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/component.dart';
import 'customer_managment_archive_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CustomerManagement extends StatefulWidget {
  static String filtter = '';
  @override
  _CustomerManagementState createState() => _CustomerManagementState();
}

class _CustomerManagementState extends State<CustomerManagement> {
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

  int _page = 1;

  int _limit = 20;

  bool _hasNextPage = true;

  bool _isFirstLoadRunning = false;

  bool _isLoadMoreRunning = false;

  List _posts = [];

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final  userID = preferences.getString('userID');
    try {
      //{{url}}/clients?user_id=1&client_status=active&page=1
      final res =
      await http.get(Uri.parse(EndPoints.BASE_URL+"/clients?user_id=$userID&client_status=${CustomerManagement.filtter}&page=$_page"));
      var data = json.decode(res.body);
      print(CustomerManagement.filtter);
      setState(() {
        _posts = data['data'];
      });
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final  userID = preferences.getString('userID');
      _page += 1; // Increase _page by 1
      try {
        final res =
        await http.get(Uri.parse(EndPoints.BASE_URL+"/clients?user_id=$userID&client_status=${CustomerManagement.filtter}&page=$_page"));
        var data =  json.decode(res.body);
        final List fetchedPosts = data['data'];
        print(CustomerManagement.filtter);
        if (fetchedPosts.length > 0) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    //..addListener(_loadMore)
    _controller = new ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    List<Widget> dismiss = [];

    showAlertDialog(BuildContext context, VoidCallback press) {
      Widget okButton =  Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Image.asset('assets/images/icons8-trash-200 1.png',width: 150,height: 150,),
            ),
          ),
          Text(
            'نقل الي ارشيف العملاء',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Cairo',fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
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
                        onTap: press,
                        child: Center(
                          child: Text(
                            'تأكيد',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
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
      key: scafolldKey,
      drawer: drawer(context: context),
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
      body: _isFirstLoadRunning
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 71,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 275,
                          height: 40,
                          decoration: BoxDecoration(
                              color: HexColor('#E6E6E6'),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'بحث',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Cairo',
                                    color: HexColor('#676767'),
                                    fontWeight: FontWeight.w400),
                              ),
                              Icon(Icons.search)
                            ],
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              modalBottomSheetFilterLeadsMenu(context,);
                            },
                            child: Image.asset(
                              'assets/images/Filter.png',
                              height: 30,
                              width: 30,
                            )),
                      ],
                    ),
                  ),
                  myDivider(3),
                  Expanded(
                    child: ListView.separated(
                        controller: _controller,
                        itemBuilder: (context, index) {
                          dismiss.add(buildCustomerManagementCard(
                            id: "${_posts[index]['id']}",
                            context: context,
                            email: _posts[index]['email'],
                            cellPhone: _posts[index]['cellphone'],
                            clientName:  _posts[index]['Name'],
                            clientState: _posts[index]['status'].toString(),
                            referral: _posts[index]['referral'].toString(),
                            whatsPhone: _posts[index]['whatsapp'],
                          ),);
                          return  Dismissible(
                            onDismissed: (direction) {
                              showAlertDialog(context, () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CustomerManagementArchive(
                                            clientID: _posts[index]['id'].toString(),
                                          ))));
                              CustomerManagementArchive.cards.add(dismiss[index]);
                            },
                            confirmDismiss: (DismissDirection direction) async {
                              showAlertDialog(context, () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CustomerManagementArchive(clientID: _posts[index]['id'].toString(),))));
                              CustomerManagementArchive.cards.add(dismiss[index]);
                            },
                            key: Key(index.toString()),
                            background: Container(
                                color: HexColor('#E6E6E6'),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 5),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/delete_sweep.png',
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'نقل للأرشيف',
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ))),


                            child: buildCustomerManagementCard(
                              id: "${_posts[index]['id']}",
                              context: context,
                              email: _posts[index]['email'],
                              cellPhone: _posts[index]['cellphone'],
                              clientName:  _posts[index]['Name'],
                              whatsPhone: _posts[index]['whatsapp'],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => myDivider(3),
                        itemCount: _posts.length),
                  ),
                  if (_isLoadMoreRunning == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  if (_hasNextPage == false)
                    Container( // only(top: 30, bottom: 40)
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      color: Colors.white,
                      // child: Center(
                      //   child: Text('لقد جلبت كل المحتوى',style: TextStyle(
                      //     color: HexColor('#2972B7'),
                      //     fontSize: 14,
                      //     fontFamily: 'Cairo',
                      //     fontWeight: FontWeight.w600,
                      //   ),),
                      // ),
                    ),
                ],
              ),
            ),
      backgroundColor: Colors.white,
    );
  }
}
