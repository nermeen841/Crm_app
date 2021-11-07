import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crm_app/componnent/component.dart';
import 'package:flutter/material.dart';

Widget buildProjectCard({
  context,
  required String type,
  required String governorate,
  required String city,
  required String price,
  required String projectName,
  required String projectID,
}) => Card(

  margin: EdgeInsets.only(bottom: 24),
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  ),
  child: Container(
    height: 210,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/house_01.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:[
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                width: 80,
                padding: EdgeInsets.symmetric(vertical: 4,),
                child: Center(
                  child: Text(
                    type,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                projectName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    governorate,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 14,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        city,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);


Widget buildProjectCardDetails({
  required String type,
  required String bathrooms,
  required String rooms,
  required String spaces,
  required String floors,
  required String Price,
  required String notes,
  required String title,
  required String titleName,
  Color? color,
  VoidCallback? press,
  Color ? color2
})
{
  List<String> imgList = [
  'assets/images/images 111.png'
  ];
  return InkWell(
    onTap: press,
    child: Container(
      color: color,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Cairo',
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Container(
                // width: 80,
                padding: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                child: Center(
                  child: Text(
                    titleName,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 50,
                color:HexColor('#FFAE48') ,
                child: Center(
                    child: Text(
                      type,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Cairo',
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          GridView.count(
            mainAxisSpacing:2,
            childAspectRatio: 1,
            crossAxisSpacing: 30,
            crossAxisCount: 3,
            padding: EdgeInsets.symmetric(vertical:  5),
            primary: false,
            shrinkWrap: true,
            children: [
              (spaces == 'null' || spaces == "") ? Row(
            children: [
              Image.asset('assets/images/plans 1.png'),
              SizedBox(width:4 ,),
              Text('لا يوجد',style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
            ],
          ) :
              Container(
                child: Row(
                  children: [
                    Image.asset('assets/images/plans 1.png'),
                    SizedBox(width:4 ,),
                    Text(spaces,style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                  ],
                ),
              ),



              (rooms == 'null' || rooms == "") ? Row(
                children: [
                  Image.asset('assets/images/home (1) 1.png'),
                  SizedBox(width:4 ,),
                  Text('لا يوجد',style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                ],
              ) :
              Container(
                child: Row(
                  children: [
                    Image.asset('assets/images/home (1) 1.png'),
                    SizedBox(width:4 ,),
                    Text(rooms,style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                  ],
                ),
              ),

              (bathrooms == 'null' || bathrooms == "") ? Row(
                children: [
                  Image.asset('assets/images/bathtub 1.png'),
                  SizedBox(width:4 ,),
                  Text("لا يوجد",style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                ],
              ) :
              Container(
                child: Row(
                  children: [
                    Image.asset('assets/images/bathtub 1.png'),
                    SizedBox(width:4 ,),
                    Text(bathrooms,style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                  ],
                ),
              ),
              (floors == 'null' || bathrooms == "") ? Row(
                children: [
                  Image.asset('assets/images/build (1) 1.png'),
                  SizedBox(width:4,),
                  Text("لا يوجد",style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                ],
              ) : Container(child: Row(
                  children: [
                    Image.asset('assets/images/build (1) 1.png'),
                    SizedBox(width:4,),
                    Text(floors,style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                  ],
                ),),

              Container(
                child: Row(
                  children: [
                    Image.asset('assets/images/build 1.png'),
                    SizedBox(width:4 ,),
                    Text('حمام سباحة',style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                  ],
                ),
              ),

              (Price == "null") ? Row(
                children: [
                  Icon(Icons.monetization_on_outlined,size: 20,),
                  SizedBox(width:4 ,),
                  Text("لا يوجد",style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                ],
              ) :

              Container(
                child: Row(
                  children: [
                    Icon(Icons.monetization_on_outlined,size: 20,),
                    SizedBox(width:4 ,),
                    Text(Price,style: TextStyle(fontSize: 12,fontFamily: 'Cairo',),)
                  ],
                ),
              ),
            ],
          ),
          CarouselSlider(
            items:imgList
                .map((item) => Container(
              child: Center(
                  child:
                  Image.asset(item, fit: BoxFit.cover, width: 400,height: 200,)),
            ))
                .toList(),
            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          (notes == 'null' || notes == "") ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Cairo',
                fontSize: 15,

              ),),) : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              // 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام'
              // ,
              notes,
              style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontSize: 15,

            ),),
          ),
        ],
      ),
    ),
  );
}
