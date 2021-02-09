import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_test_app/widgets/WishListCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Your Wishlist",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          floatingActionButton: Container(
            margin: EdgeInsets.only(right: 10.w),
            height: 50.h,
            width: width * 0.85,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffB0E91C),
              Color(0xff50AC02),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Center(
              child: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: SingleChildScrollView(
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
                                                ["description"]))
                                ],
                              )
                            : CircularProgressIndicator();
                      }),
                ],
              ),
            ),
          )),
    );
  }
}
