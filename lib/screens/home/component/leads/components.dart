import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/component/controller/api_change_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/api_genral_info.dart';




leadTextfield({required TextInputType type,required String txt,  double? height,}) {
  return Container(
    height: height,
    padding: EdgeInsets.symmetric( horizontal: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: HexColor("#E6E6E6")
    ),
    child: TextFormField(
      initialValue: txt,
      // maxLines: lines,
      textDirection: TextDirection.rtl,
      keyboardType: type,
      // controller: controller,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Cairo',
        fontSize: 15,
      ),
      decoration: InputDecoration(
        hintText: '',
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    ),
  );
}



class DropDown extends StatefulWidget {
  final String txt;
  final String id;

  const DropDown({Key? key,required this.txt,required this.id}) : super(key: key);
  // const DropDown({Key? key}) : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}
class _DropDownState extends State<DropDown> {

  // static String _value = "";
  var _list = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context , state){} ,
      builder: (context , state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only( right: 5),
              child: Text(widget.txt,style: TextStyle(
                fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.bold,
              ),),
            ),
            Stack(
              children: [
                InkWell(
                   onTap: ()=> AppCubit.get(context).changeShowMenu(),
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                        color: HexColor('#E6E6E6'),
                        borderRadius: BorderRadius.circular(10)),
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    width: 170,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppCubit.get(context).textMenu.toString(),
                          textDirection: TextDirection.rtl,
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined,),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: AppCubit.get(context).showMenu,
                  child: Padding(
                    padding: const EdgeInsets.only(top:18 ,right: 80),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: 70,
                        width:130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                          boxShadow: [
                             BoxShadow(
                               color: Colors.black12,
                               offset:Offset(0,1),
                                spreadRadius: 1
                             ),
                          ]
                        ),
                        // color: Colors.red,
                        child: FutureBuilder(
                          future: getGeneralInfo(),
                          builder:(context, AsyncSnapshot snapshot){
                            if(snapshot.hasData){
                              Map  d = snapshot.data['ClientStatusList'];
                              d.forEach((key, value) {_list.add(value) ;});
                              print(_list.length);
                              return ListView.separated(
                                  padding: EdgeInsets.only(left: 10,top: 10),
                                  itemBuilder: (context , index) => InkWell(
                                      onTap: (){
                                        // print('ggg ${_list[0]}');
                                        AppCubit.get(context).changeTextMenu(val: _list[index].toString());
                                        AppCubit.get(context).changeShowMenu();
                                       // var  d=snapshot.data['ClientStatusList'].map((entry) => _list.add(entry.value)).toList();
                                        // List<Weight> weightData =
                                        //   mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
                                      },
                                      child: Text(_list[index])),
                                  separatorBuilder:(context , index) => SizedBox(
                                    height: 20,
                                  ),
                                  itemCount: snapshot.data.length);
                            }else{
                              return Container();
                            }
                          },
                        ),
                        //   List<String>
                        //
                        //
                        // _list = ['Active','Archive','Cold'];
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}


////////////////////////////////////////////////////////////////////

class DropDownClass extends StatefulWidget {
  final String txt;
  final String id;

  const DropDownClass({Key? key,required this.txt,required this.id}) : super(key: key);
  // const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownClassState createState() => _DropDownClassState();
}

class _DropDownClassState extends State<DropDownClass> {

  // static String _value = "";
  var _list = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context , state){} ,
      builder: (context , state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only( right: 5),
              child: Text(widget.txt,style: TextStyle(
                fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.bold,
              ),),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: ()=> AppCubit.get(context).changeShowMenu1(),
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                        color: HexColor('#E6E6E6'),
                        borderRadius: BorderRadius.circular(10)),
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    width: 170,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppCubit.get(context).textMenu1.toString(),
                          textDirection: TextDirection.rtl,
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined,),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: AppCubit.get(context).showMenu1,
                  child: Padding(
                    padding: const EdgeInsets.only(top:18 ,right: 80),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                          height: 80,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset:Offset(0,1),
                                    spreadRadius: 1
                                ),
                              ]
                          ),
                          // color: Colors.red,
                          child: FutureBuilder(
                            future: getGeneralInfo(),
                            builder:(context, AsyncSnapshot snapshot){
                              if(snapshot.hasData){
                                Map  d = snapshot.data['ClientClassList'];
                                d.forEach((key, value) {_list.add(value) ;});
                                print(_list.length);
                                return ListView.separated(
                                    padding: EdgeInsets.only(left: 10,top: 10),
                                    itemBuilder: (context , index) => InkWell(
                                        onTap: (){
                                          // print('ggg ${_list[0]}');
                                          AppCubit.get(context).changeTextMenu1(val: _list[index].toString());
                                          AppCubit.get(context).changeShowMenu1();
                                          // var  d=snapshot.data['ClientStatusList'].map((entry) => _list.add(entry.value)).toList();
                                          // List<Weight> weightData =
                                          //   mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
                                        },
                                        child: Text(_list[index])),
                                    separatorBuilder:(context , index) => SizedBox(
                                      height: 20,
                                    ),
                                    itemCount: snapshot.data.length);
                              }else{
                                return Container();
                              }
                            },
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}



//////////////////////////////////////////////////
// Refferal

class DropDownRefferal extends StatefulWidget {
  final String txt;
  final String id;

  const DropDownRefferal({Key? key,required this.txt,required this.id}) : super(key: key);
  // const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownRefferalState createState() => _DropDownRefferalState();
}

class _DropDownRefferalState extends State<DropDownRefferal> {

  // static String _value = "";
  var _list = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context , state){} ,
      builder: (context , state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only( right: 5),
              child: Text(widget.txt,style: TextStyle(
                fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.bold,
              ),),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: ()=> AppCubit.get(context).changeShowMenu2(),
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                        color: HexColor('#E6E6E6'),
                        borderRadius: BorderRadius.circular(10)),
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    width: 170,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppCubit.get(context).textMenu2.toString(),
                          textDirection: TextDirection.rtl,
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined,),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: AppCubit.get(context).showMenu2,
                  child: Padding(
                    padding: const EdgeInsets.only(top:18 ,right: 80),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: 80,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset:Offset(0,1),
                                  spreadRadius: 1
                              ),
                            ]
                        ),
                        // color: Colors.red,
                        child: FutureBuilder(
                          future: getGeneralInfo(),
                          builder:(context, AsyncSnapshot snapshot){
                            if(snapshot.hasData){
                              Map  d = snapshot.data['ClientRefferalList'];
                              d.forEach((key, value) {_list.add(value) ;});
                              print(_list.length);
                              return ListView.separated(
                                  padding: EdgeInsets.only(left: 10,top: 10),
                                  itemBuilder: (context , index) => InkWell(
                                      onTap: (){
                                        // print('ggg ${_list[0]}');
                                        AppCubit.get(context).changeTextMenu2(val: _list[index].toString());
                                        AppCubit.get(context).changeShowMenu2();
                                        // var  d=snapshot.data['ClientStatusList'].map((entry) => _list.add(entry.value)).toList();
                                        // List<Weight> weightData =
                                        //   mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
                                      },
                                      child: Text(_list[index])),
                                  separatorBuilder:(context , index) => SizedBox(
                                    height: 20,
                                  ),
                                  itemCount: snapshot.data.length);
                            }else{
                              return Container();
                            }
                          },
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

