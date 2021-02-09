import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class You extends StatefulWidget {
  @override
  _YouState createState() => _YouState();
}

class _YouState extends State<You> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "You",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 18.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Icon(
                      Icons.file_copy_outlined,
                      size: 30,
                      color: Color(0xff6FBE0B),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "My Orders",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Color(0xff6FBE0B),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "My Favorite",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 30,
                      color: Color(0xff6FBE0B),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Payment Details",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Icon(
                      Icons.settings,
                      size: 30,
                      color: Color(0xff6FBE0B),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "My Account",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
