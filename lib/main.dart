import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/view/add screen.dart';
import 'screen/view/home.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => home(),
        "add":(context) => addScreen(),
      },
    ),
  );
}
