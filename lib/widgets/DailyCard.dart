import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_test_app/bloc/food_bloc.dart';
import 'package:grocery_test_app/events/food_event.dart';
import 'package:grocery_test_app/model/Food.dart';

class DailyCard extends StatefulWidget {
  String image, price, name, quentity, description, color1, color2;
  int quan, id;
  DailyCard(
      {this.id,
      this.image,
      this.name,
      this.price,
      this.quentity,
      this.description,
      this.color1,
      this.color2,
      this.quan});
  @override
  _DailyCardState createState() => _DailyCardState();
}

class _DailyCardState extends State<DailyCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
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
                  height: 100.h,
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
              bottom: 20.h,
              right: 20.w,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(
                    Foods(
                        widget.id,
                        widget.image,
                        widget.name,
                        widget.price,
                        widget.quentity,
                        widget.color1,
                        widget.color2,
                        widget.description,
                        widget.quan),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                          colors: [
                            Color(int.parse(widget.color1)),
                            Color(int.parse(widget.color2)),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
