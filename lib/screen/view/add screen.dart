import 'package:database_flutter/Model/DB_Model.dart';
import 'package:database_flutter/screen/controller/DB_controller.dart';
import 'package:database_flutter/utills/db_helper_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utills/db_helper.dart';

class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtamount = TextEditingController();
    TextEditingController txtnotes = TextEditingController();
    TextEditingController txtdmcatagory = TextEditingController();
    TextEditingController txtDmWallet = TextEditingController();
    DB_controller db_controller = Get.put(DB_controller());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Your Money Cracker",
              style: GoogleFonts.play(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                CupertinoIcons.left_chevron,
                color: Colors.black,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                CupertinoIcons.line_horizontal_3_decrease,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text("How Much?",
                          style: GoogleFonts.play(
                              color: Color(0xffad87ff), fontSize: 20)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffEEE5FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Color(0xff7F3DFF),
                      style: GoogleFonts.play(color: Color(0xff7F3DFF)),
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.play(color: Color(0xff7F3DFF)),
                        hintText: "Type Your Amount",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: txtamount,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color(0xffEEE5FF),
                    child: DropdownMenu(
                        controller: txtdmcatagory,
                        width: 380,
                        menuStyle: MenuStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Color(0xffEEE5FF))),
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                              value: "food",
                              label: "food",
                              leadingIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/food.png',
                                  width: 50,
                                  height: 50,
                                ),
                              )),
                          DropdownMenuEntry(
                              value: "bonus",
                              label: "bonus",
                              leadingIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/bonus.png',
                                  width: 50,
                                  height: 50,
                                ),
                              )),
                          DropdownMenuEntry(
                              value: "ott",
                              label: "ott",
                              leadingIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/food.png',
                                  width: 50,
                                  height: 50,
                                ),
                              )),
                          DropdownMenuEntry(
                              value: "salary",
                              label: "salary",
                              leadingIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/salary.png',
                                  width: 50,
                                  height: 50,
                                ),
                              )),
                          DropdownMenuEntry(
                              value: "travel",
                              label: "travel",
                              leadingIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/travel.png',
                                  width: 50,
                                  height: 50,
                                ),
                              )),
                        ],
                        hintText: "Catagory"),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text("Enter Our Notes",
                          style: GoogleFonts.play(
                              color: Color(0xffad87ff), fontSize: 20)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffEEE5FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      maxLines: 4,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xff7F3DFF),
                      style: GoogleFonts.play(color: Color(0xff7F3DFF)),
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.play(color: Color(0xff7F3DFF)),
                        hintText: "Type Your Amount",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: txtnotes,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color(0xffEEE5FF),
                    child: DropdownMenu(
                        controller: txtDmWallet,
                        width: 300,
                        menuStyle: MenuStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Color(0xffEEE5FF))),
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                              value: "paytm",
                              label: "Paytm",
                              leadingIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/paytm.jpg',
                                  width: 50,
                                  height: 50,
                                ),
                              )),
                          DropdownMenuEntry(
                              value: "phonepay",
                              label: "PhonePay",
                              leadingIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/phonepay.jpg',
                                  width: 50,
                                  height: 50,
                                ),
                              )),
                          DropdownMenuEntry(
                              value: "amazonpay",
                              label: "Amozon Pay",
                              leadingIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/amazonpay.jpg',
                                  width: 50,
                                  height: 50,
                                ),
                              )),
                        ],
                        hintText: "Wallet"),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xffEEE5FF),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.photo_camera_solid,
                            color: Color(0xff7F3DFF)),
                        SizedBox(width: 10),
                        Text("Add attachment",
                            style: GoogleFonts.play(
                                fontSize: 20, color: Color(0xff7F3DFF))),
                      ],
                    )),
                  ),
                ),
                InkWell(
                    onTap: () {
                      int tempexp = int.parse(txtamount.text as String);
                      int tempexp2 = db_controller.expence.value + tempexp;
                      db_controller.expence = tempexp2.obs;
                      db_controller.data.add(DB_Model(
                          status: "expence",
                          amount: int.parse(txtamount.text),
                          img: "assets/images/${txtdmcatagory.text}.png",
                          name: "${txtdmcatagory.text}",
                          notes: "${txtnotes.text}"));
                      db_controller.check();
                      Get.toNamed('home');
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: Center(
                          child: Text(
                        "Expence",
                        style: GoogleFonts.play(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    )),
                SizedBox(height: 10),
                InkWell(
                    onTap: () async {
                      int tempexp = int.parse(txtamount.text as String);
                      int tempexp2 = db_controller.income.value + tempexp;
                      db_controller.income = tempexp2.obs;
                      db_controller.check();
                      DB_Helper_2 db_helper_2 = DB_Helper_2();
                      await db_helper_2.insertDB(DB_Model(
                          status: "income",
                          amount: int.parse(txtamount.text),
                          img: "assets/images/${txtdmcatagory.text}.png",
                          name: "${txtdmcatagory.text}",
                          notes: "${txtnotes.text}"));
                      DB_Helper_2 db_helper = DB_Helper_2();
                      DB_Model model =DB_Model();
                      Get.toNamed('home');
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                      child: Center(
                          child: Text(
                        "Income",
                        style: GoogleFonts.play(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    )),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
