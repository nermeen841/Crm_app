import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/component/controller/get_done_task.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:flutter/material.dart';

class DoneTasks extends StatefulWidget {

  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getDoneTask(),
          builder: (context , AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return ListView.separated(
            primary: true,
            shrinkWrap: true,
              itemBuilder: (context, index) =>
                  DoneTasksCard(
                  context: context,
                  clientName: snapshot.data[index]['ClientDetails']['Name'].toString(),
                    notes: snapshot.data[index]['ClientDetails']['Notes'].toString(),
                  status: snapshot.data[index]['ClientDetails']['status'].toString(),
                  phone: snapshot.data[index]['ClientDetails']['cellphone'].toString(),
                  contactingDateTime: snapshot.data[index]['contactingDateTime'].toString(),
              ),
              separatorBuilder: (context , index) =>myDivider(2),
            itemCount: snapshot.data.length,

          );
        }else{
          return  Container();
        }
      },
      ),
    );}
}
/*
*             Dismissible(
              key: Key(items[index].toString()),
              child: DoneTasksCard(context),
              background: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete, color: HexColor('#C50B0B'),size:30 ,))),
              confirmDismiss: (index)async{
                showAlertDialog(press: (){}, path: 'assets/images/icons8-delete-200 1.png', title: 'تاكيد الحذف', context: context);
              },
              onDismissed: ( direction){
                items.removeAt(index);
              },
            ),
*/

//             DoneTasksCard(context),

/* primary: true,
          shrinkWrap: true,
          children: [
            DoneTasksCard(context:  context,clientName: snapshot.data['Name'],contactType: snapshot.data['contactingType']),
          ],*/