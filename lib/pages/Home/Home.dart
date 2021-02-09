import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_test_app/pages/Home/Daily.dart';
import 'package:grocery_test_app/pages/Home/NewArr.dart';
import 'package:grocery_test_app/widgets/Cards.dart';
import 'package:grocery_test_app/widgets/Category.dart';
import 'package:grocery_test_app/widgets/SearchBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 70,
        toolbarHeight: height * 0.10,
        leading: Image.asset("assets/scooter.jpg"),
        centerTitle: true,
        title: SearchBar(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: height,
          margin: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/category.json"),
                  builder: (context, snapshot) {
                    var my_data;
                    snapshot.data != null
                        ? my_data = json.decode(snapshot.data.toString())
                        : print('loading');

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          snapshot.data != null
                              ? Row(
                                  children: [
                                    for (var i = 0; i < my_data.length; i++)
                                      Category(
                                        image: my_data[i]["image"],
                                        name: my_data[i]["name"],
                                        color: my_data[i]["color"],
                                      )
                                  ],
                                )
                              : CircularProgressIndicator()
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(color: Color(0xffFC5455)),
                    child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          "NEW ARRIVALS",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.49, top: 10.h),
                    child: Text(
                      "SEE ALL",
                      style: TextStyle(color: Color(0xffFC5455)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              // aaaaaaaaaaaaaaaaaa
              NewArr(),
              SizedBox(
                height: 19.h,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(color: Color(0xff03506C)),
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "DAILY NEEDS",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.50),
                    child: Text(
                      "SEE ALL",
                      style: TextStyle(color: Color(0xffFC5455)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  margin: EdgeInsets.only(right: 20.w, bottom: 20.h),
                  child: Daily()),
            ],
          ),
        ),
      ),
    );
  }
}
