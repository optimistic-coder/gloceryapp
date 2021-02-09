import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatefulWidget {
  String image;
  String name;
  String color;
  Category({this.image, this.name, this.color});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 90.h,
      width: 80.w,
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            left: 10.w,
            child: Column(
              children: [
                Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  width: 50.w,
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Text(
                    widget.name,
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(int.parse(widget.color)).withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ],
      ),
    );
  }
}
