import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_test_app/bloc/food_bloc.dart';
import 'package:grocery_test_app/events/food_event.dart';

class AddCart extends StatefulWidget {
  String image, price, name, quentity, description;
  int index;
  AddCart(
      {this.image,
      this.name,
      this.price,
      this.quentity,
      this.description,
      this.index});
  @override
  _AddCartState createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
        height: height * 0.15,
        width: width * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Image.asset(
                  widget.image,
                  height: 100,
                  width: width * 0.20,
                )),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(5), child: Text("200")),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Opacity(
                          opacity: 0.7,
                          child: Text(
                            widget.quentity,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              right: 20.w,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffA8DE1C),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "1",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<FoodBloc>(context).add(
                          FoodEvent.delete(widget.index),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffA8DE1C),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
