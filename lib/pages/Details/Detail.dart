import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_test_app/bloc/food_bloc.dart';
import 'package:grocery_test_app/events/food_event.dart';
import 'package:grocery_test_app/model/Food.dart';
import 'package:grocery_test_app/pages/Cart/Cart.dart';
import 'package:grocery_test_app/pages/Home/Daily.dart';
import 'package:grocery_test_app/widgets/DetailSceenCard.dart';
import 'CurveDetail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Detail extends StatefulWidget {
  String image, price, name, quentity, description, color1, color2;
  int quan, id;
  Detail(
      {this.id,
      this.image,
      this.name,
      this.price,
      this.quentity,
      this.color1,
      this.color2,
      this.description,
      this.quan});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(width,
                height), //You can Replace this with your desired WIDTH and HEIGHT
            painter: DetailCurve(color1: widget.color1, color2: widget.color2),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    "Details",
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                ),
                SizedBox(
                  height: 50.h,
                ),
                DetailScreenCard(
                    image: widget.image,
                    name: widget.name,
                    price: widget.price,
                    quentity: widget.quentity,
                    description: widget.description),
                SizedBox(
                  height: 30.h,
                ),
                Opacity(
                  opacity: 0.6,
                  child: Container(
                    width: width * 0.83,
                    child: Text(widget.description),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: width * 0.60, top: 20.h),
                  child: Text(
                    "Related Items",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Daily(),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              child: FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<FoodBloc>(context).add(
                    FoodEvent.add(
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
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(int.parse(widget.color1)),
                    Color(int.parse(widget.color2)),
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
