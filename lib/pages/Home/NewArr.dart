import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_test_app/widgets/Cards.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArr extends StatefulWidget {
  @override
  _NewArrState createState() => _NewArrState();
}

class _NewArrState extends State<NewArr> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/new.json"),
        builder: (context, snapshot) {
          var my_data;
          snapshot.data != null
              ? my_data = json.decode(snapshot.data.toString())
              : print('loading');

          return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: snapshot.data != null
                  ? Row(
                      children: [
                        for (var i = 0; i < my_data.length; i++)
                          Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Cards(
                                image: my_data[i]["image"],
                                name: my_data[i]["name"],
                                price: my_data[i]["price"],
                                quentity: my_data[i]["quentety"],
                                color1: my_data[i]["color1"],
                                color2: my_data[i]["color2"],
                                description: my_data[i]["description"],
                                quan: my_data[i]["quan"],
                              ))
                      ],
                    )
                  : Text(""));
        });
  }
}
