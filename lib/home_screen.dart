import 'package:dodge/animations/animations.dart';
import 'package:dodge/animations/fade_animation.dart';
import 'package:dodge/constants.dart';
import 'package:dodge/widgets/bottom_nav_bar.dart';
import 'package:dodge/widgets/custom_app_bar.dart';
import 'package:dodge/widgets/first_card.dart';
import 'package:dodge/widgets/second_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:dodge/card_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



import 'SecondScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double temperature = 0;

  double humidity = 0;

  void fetchSearchHumid() async{
    var searchResultHumid = await http.get(Uri.parse('https://io.adafruit.com/api/v2/DogeEngizear/feeds/humid-feed'));
    var resultHumid = json.decode(searchResultHumid.body);
    var dataHumid =resultHumid['last_value'];
    var dataHumidDouble = double.parse(dataHumid);
    setState(() {
      humidity=dataHumidDouble;
    });

  }

  void fetchSearchTemp() async{
    var searchResultTemp = await http.get(Uri.parse('https://io.adafruit.com/api/v2/DogeEngizear/feeds/temp-feed'));
    var resultTemp = json.decode(searchResultTemp.body);
    var dataTemp =resultTemp['last_value'];
    var dataTempDouble = double.parse(dataTemp);
    setState(() {
      temperature=dataTempDouble;
    });

  }

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 50.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const CardScreen(),
                            type: PageTransitionType.fromBottom,
                          ),
                        );
                      },
                      child: const CustomAppBar(),
                    ),
                    Text(
                      'Dashboard',
                      style: kHeadingStyle,
                    ),
                    SizedBox(height: 15.h),
                    SlideAnimation(
                      begin: const Offset(0, 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'TODAY',
                            style: kUpperCase,
                          ),
                          SizedBox(height: 5.h),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(
                              'assets/anaa5-qi7dc.svg',
                              width: 30.r,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Temperature',
                              style: kHeadingStyle,
                            ),

                            trailing: Text(
                              temperature.toString()+'     °C',
                              style: kMoneyStyle.copyWith(fontSize: 14.r),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(
                              'assets/anaa5-qi7dc.svg',
                              width: 30.r,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Humidity',
                              style: kHeadingStyle,
                            ),

                            trailing: Text(
                              humidity.toString()+' %RH',
                              style: kMoneyStyle.copyWith(fontSize: 14.r),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Bottom Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ScaleAnimation(
                begin: 0,
                child: GestureDetector(
                  onTap: () {
                    fetchSearchHumid();
                    fetchSearchTemp();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 16.r,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/anaa5-qi7dc.svg',
                  width: 22.r,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/anaa5-qi7dc.svg',
                  width: 22.r,
                  color: Colors.white,
                ),
              ),
              ScaleAnimation(
                begin: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child:  WebScreen(),
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
        ],
      ),
    );
  }
}
