import 'package:flutter/material.dart';
import 'package:twoGeeks/app/detail/detailInfo/infoTitle.dart';

Widget aboutMe(aboutMe) {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.symmetric(vertical: 20.0),
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(10.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        infoTitle("About me"),
        Text(aboutMe),
      ],
    ),
  );
}
