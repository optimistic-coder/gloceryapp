import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_test_app/widgets/WishListCard.dart';
import './Curve.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 10.w),
        height: 50.h,
        width: width * 0.90,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffA8DE1C),
          Color(0xff50AC02),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Stack(
          children: [
            Positioned(
                top: 13.h,
                left: 30.w,
                child: Text(
                  "Continue to checkout ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
            Positioned(
                top: 13.h,
                right: 15.w,
                child: Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                    Text(
                      "200",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ))
          ],
        ),
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(width,
                height), //You can Replace this with your desired WIDTH and HEIGHT
            painter: RPSCustomPainter(),
          ),
          SingleChildScrollView(
            child: Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString("assets/wishlist.json"),
                      builder: (context, snapshot) {
                        var my_data;
                        snapshot.data != null
                            ? my_data = json.decode(snapshot.data.toString())
                            : print('loading');

                        return snapshot.data != null
                            ? Column(
                                children: [
                                  for (var i = 0; i < my_data.length; i++)
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: WishListCard(
                                            image: my_data[i]["image"],
                                            name: my_data[i]["name"],
                                            price: my_data[i]["price"],
                                            quentity: my_data[i]["quentety"],
                                            description: my_data[i]
                                                ["description"])),
                                  Container(
                                    margin: EdgeInsets.only(top: height * 0.25),
                                    width: width * 0.88,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Subtotal"),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.60),
                                                child: Text("210"))
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.h, bottom: 10.h),
                                          child: Row(
                                            children: [
                                              Text("Delivery Fee"),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: width * 0.57),
                                                  child: Text("1"))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.h, bottom: 10.h),
                                          child: Row(
                                            children: [
                                              Text("Total"),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: width * 0.65),
                                                  child: Text("210"))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : CircularProgressIndicator();
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
