import 'package:dodge/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dodge/secondscreen.dart';
class SecondCard extends StatelessWidget {
  const SecondCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(
            Icons.euro_rounded,
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'EURO',
              ),
              SizedBox(height: 5.h),
              Text(
                '€ 5 312,05',

              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.keyboard_arrow_down,
            size: 28.r,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
