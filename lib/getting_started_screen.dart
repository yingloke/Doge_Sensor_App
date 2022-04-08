import 'package:dodge/animations/animations.dart';
import 'package:dodge/animations/fade_animation.dart';
import 'package:dodge/animations/scale_animation.dart';
import 'package:dodge/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';


class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: FadeAnimation(
                intervalEnd: 0.6,
                child: SvgPicture.asset(
                  'assets/anaa5-qi7dc.svg',
                  height: 350.h,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            FadeAnimation(
              intervalStart: 0.3,
              child: Text(
                'Doge Engineer \nIoT Sensor ',
                style: TextStyle(
                  fontSize: 36.r,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ScaleAnimation(
              begin: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child:  HomeScreen(),
                      type: PageTransitionType.fadeIn,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16.r,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
