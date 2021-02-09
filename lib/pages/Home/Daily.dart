import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_test_app/pages/Details/Detail.dart';
import 'package:grocery_test_app/widgets/DailyCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("assets/new.json"),
            builder: (context, snapshot) {
              var my_data;
              snapshot.data != null
                  ? my_data = json.decode(snapshot.data.toString())
                  : print('loading');

              return snapshot.data != null
                  ? Column(
                      children: [
                        for (var i = 0; i < my_data.length; i++)
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail(
                                          image: my_data[i]["image"],
                                          name: my_data[i]["name"],
                                          price: my_data[i]["price"],
                                          quentity: my_data[i]["quentety"],
                                          color1: my_data[i]["color1"],
                                          color2: my_data[i]["color2"],
                                          description: my_data[i]
                                              ["description"])));
                            },
                            child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: DailyCard(
                                    image: my_data[i]["image"],
                                    name: my_data[i]["name"],
                                    price: my_data[i]["price"],
                                    quentity: my_data[i]["quentety"],
                                    color1: my_data[i]["color1"],
                                    color2: my_data[i]["color2"],
                                    description: my_data[i]["description"],
                                    quan: my_data[i]["quan"])),
                          )
                      ],
                    )
                  : Text("");
            }),
      ],
    );
  }
}
