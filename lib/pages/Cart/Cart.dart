import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_test_app/bloc/food_bloc.dart';
import 'package:grocery_test_app/model/Food.dart';
import 'package:grocery_test_app/widgets/AddCart.dart';
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
                  BlocConsumer<FoodBloc, List<Foods>>(
                    builder: (context, foodList) {
                      return Column(
                        children: [
                          if (foodList.length == 0)
                            Container(
                                margin: EdgeInsets.only(top: height * 0.40),
                                child: Text("Empty Cart"))
                          else
                            for (var i = 0; i < foodList.length; i++)
                              Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: AddCart(
                                    image: foodList[i].image,
                                    name: foodList[i].name,
                                    price: foodList[i].price,
                                    quentity: foodList[i].quentety,
                                    description: foodList[i].description,
                                    index: i,
                                  )),
                          if (foodList.length != 0)
                            Container(
                              margin: EdgeInsets.only(
                                  top: height * 0.10, bottom: height * 0.10),
                              width: width * 0.88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: 10.w, top: 30.h),
                                    height: 50.h,
                                    width: width * 0.90,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                          Color(0xffA8DE1C),
                                          Color(0xff50AC02),
                                        ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top: 13.h,
                                            left: 30.w,
                                            child: Text(
                                              "Continue to checkout ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
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
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                    listener: (BuildContext context, foodList) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Deleted!')),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
