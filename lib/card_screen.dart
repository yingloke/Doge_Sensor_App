import 'package:dodge/animations/scale_animation.dart';
import 'package:dodge/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  final number= 0167886460;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.h,
          bottom: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 26.r,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20.h),
            ScaleAnimation(
              child: Stack(
                children: [

                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    child: Text(
                      'Andrew Joshep',
                      style: kHeadingStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "",
              style: kUpperCase,
            ),
            SizedBox(height: 5.h),
            Text(
              "CONTACT US",
              style: TextStyle(fontSize: 24.r),
            ),
            SizedBox(height: 15.h),
            const FeatureCard(
              title: 'doge_engineer@gmail.com',
              iconPath: 'assets/images/rocket.svg',
              color: kOrange,
            ),
            SizedBox(height: 10.h),
            const FeatureCard(
              title: '016-7886460',
              iconPath: 'assets/images/piggy.svg',
              color: kBlue,
            ),
            SizedBox(height: 10.h),
            const FeatureCard(
              title: 'Sales Engineer',
              iconPath: 'assets/images/airplane.svg',
              color: kPink,
            ),
            SizedBox(height: 10.h),
            const FeatureCard(
              title: 'Chong Ying Loke',
              iconPath: 'assets/images/interest.svg',
              color: kGreen,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Call us Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.r,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon:  Icon(Icons.arrow_forward_ios_rounded,
                        size: 16.h),
                    onPressed: () async{
                       launch('tel://$number');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.color,
  }) : super(key: key);

  final String title;
  final String iconPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 50.r,
          height: 50.r,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: SvgPicture.asset(
            iconPath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          title,
          style: kHeadingStyle,
        ),
      ],
    );
  }
}
