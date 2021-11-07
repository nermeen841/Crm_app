
import 'package:crm_app/componnent/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCardServicesScreen({
  required String text,
  required String subText,
})=>  Container(
  margin: EdgeInsets.symmetric(horizontal: 10),
  width: 375,
  height: 65,
  child: Row(
    // mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
            fontSize: 16,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w400,
            color: HexColor('#292B2D')),
      ),
      Spacer(),
      Text(
        subText,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: HexColor('#91919F'),
          fontFamily: "Cairo",
          fontSize: 14,
        ),
      ),
      SizedBox(
        width: 2,
      ),
      Icon(
        Icons.arrow_forward_ios_rounded,
        size: 24,
        color: HexColor('#676767'),
      ),
    ],
  ),
);