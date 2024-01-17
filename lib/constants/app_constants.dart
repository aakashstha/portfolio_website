import 'package:flutter/material.dart';

final navKey1 = GlobalKey<NavigatorState>();

// const kSendButtonTextStyle = TextStyle(
//   color: Colors.lightBlueAccent,
//   fontWeight: FontWeight.bold,
//   fontSize: 18.0,
// );

class AppConstants {
  // static const String endpoint = "https://perr-staging.goldoffers.in/";
  static const String endpoint = "https://perr.myjobladder.com/";
  static const String socketUrl =
      "wss://centrifugo.myjobladder.com/connection/websocket";

//other constants
  static const String googleToken = 'googleToken';
  static const String accessToken = "accessToken";
}

const kSizedBox = SizedBox(height: 10);
const kSizedSmallBox = SizedBox(height: 6);

// double screenWidth = MediaQuery.of(navKey.currentContext!).size.width;
// double screenHeight = MediaQuery.of(navKey.currentContext!).size.height;
