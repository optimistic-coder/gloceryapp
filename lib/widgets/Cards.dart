import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cards extends StatefulWidget {
  String image, price, name, quentity, color1, color2, description;
  Cards(
      {this.image,
      this.name,
      this.price,
      this.quentity,
      this.color1,
      this.color2,
      this.description});
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
      height: height * 0.27,
      width: width * 0.43,
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
          Positioned(
              right: 9.w,
              top: 4.h,
              child: Opacity(
                opacity: 0.5,
                child: Icon(
                  Icons.favorite_border,
                  size: 27,
                ),
              )),
          Positioned(
              top: 30.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.image,
                    width: width * 0.35,
                    height: height * 0.12,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 2.h, left: 7.w),
                      child: Text(widget.price)),
                  Padding(
                      padding: EdgeInsets.only(top: 1.h, left: 7.w),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 1.h, left: 7.w),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          widget.quentity,
                          style: TextStyle(fontSize: 12),
                        ),
                      ))
                ],
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: 30.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(int.parse(widget.color1)),
                  Color(int.parse(widget.color2)),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                width: width * 0.43,
                child: Center(
                    child: Text(
                  "ADD to Cart",
                  style: TextStyle(color: Colors.white),
                )),
              ))
        ],
      ),
    );
  }
}
