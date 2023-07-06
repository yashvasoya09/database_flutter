import 'package:database_flutter/Model/DB_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DB_controller extends GetxController {
  double income = 0, expence = 0, total = 0;
  List<DB_Model> data = [
    DB_Model(
        name: "salary",
        img: "assets/images/salary.png",
        amount: 20000,
        status: "income"),
    DB_Model(
        name: "ott",
        img: "assets/images/ott.png",
        amount: 200,
        status: "expence"),
    DB_Model(
        name: "shoping",
        img: "assets/images/shoping.png",
        amount: 200,
        status: "expence"),
    DB_Model(
        name: "bonus",
        img: "assets/images/bonus.png",
        amount: 2000,
        status: "income"),
    DB_Model(
        name: "travel",
        img: "assets/images/travel.png",
        amount: 2000,
        status: "expence"),
    DB_Model(
        name: "food",
        img: "assets/images/food.png",
        amount: 1000,
        status: "expence"),
  ];
  int? addincome;
  void check() {
    int i = 0;
    for (i = 0; i <= data.length - 1; i++)
      if (data[i].status == "income") {
        income = income + data[i].amount!;
      } else {
        expence = expence + data[i].amount!;
      }
    total = income - expence;
  }
}
