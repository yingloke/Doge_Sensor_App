import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:dodge/getting_started_screen.dart';
import 'package:dodge/animations/animations.dart';
import 'package:dodge/getting_started_screen.dart';

class WebScreen extends StatelessWidget {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) => Scaffold(

    body: WebView(
      backgroundColor: Colors.white,
      initialUrl: 'https://yingloke.github.io/lifetime_chart_temp_humid/',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller){
        this.controller = controller;
      },
      onPageStarted: (url){
        print('New website" $url');
      },
    ),
    floatingActionButton:
    ScaleAnimation(
      begin: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child:  GettingStartedScreen(),
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
    )
    ,
  );


}
