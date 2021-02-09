import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreenCard extends StatefulWidget {
  String image, price, name, quentity, description;
  DetailScreenCard(
      {this.image, this.name, this.price, this.quentity, this.description});
  @override
  _DetailScreenCardState createState() => _DetailScreenCardState();
}

class _DetailScreenCardState extends State<DetailScreenCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
      height: height * 0.46,
      width: width * 0.83,
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
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        children: [
          Positioned(
              right: 9.w,
              top: 4.h,
              child: Opacity(
                opacity: 0.5,
                child: Icon(
                  Icons.favorite_border,
                  size: 29,
                ),
              )),
          Positioned(
              top: 30.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.13),
                    child: Image.asset(
                      widget.image,
                      width: width * 0.55,
                      height: height * 0.28,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 2.h, left: width * 0.10),
                      child: Text(widget.price)),
                  Padding(
                      padding: EdgeInsets.only(top: 5.h, left: width * 0.10),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 5.h, left: width * 0.10),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          widget.quentity,
                          style: TextStyle(fontSize: 12),
                        ),
                      ))
                ],
              )),
        ],
      ),
    );
  }
}
