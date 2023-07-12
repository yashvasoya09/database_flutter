import 'package:database_flutter/Model/DB_Model.dart';
import 'package:get/get.dart';
class DB_controller extends GetxController {
  RxInt income = 0.obs, expence = 0.obs, total = 0.obs;
  List<DB_Model> data = [];
  int? addincome;
  void check() {
    int i = 0;
    int inc = 0;
    int ex = 0;
    for (i = 0; i <data.length; i++) {
      if (data[i].status == "income") {
        inc = inc + data[i].amount!;
      } else {
    ex = ex + data[i].amount!;
      }
      // total = income - expence.value;
      income.value = inc;
      expence.value = ex;
      total.value = income.value - expence.value;
    }
  }


}
