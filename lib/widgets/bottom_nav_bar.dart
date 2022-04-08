import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';



class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 25.h, top: 15.h),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            onPressed: () {fetchSearchHumid();
            fetchSearchTemp();},
            icon: Icon(
              Icons.refresh,
              color: Colors.orangeAccent,
              size: 40.0,
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
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/anaa5-qi7dc.svg',
              width: 22.r,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
