import 'package:database_flutter/screen/controller/DB_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtamount = TextEditingController();
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Text("How Much?", style: GoogleFonts.play(color: Color(
                        0xffad87ff), fontSize: 20)),
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
                      border: OutlineInputBorder(borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),),
                    controller: txtamount,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  menuStyle: MenuStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xffEEE5FF))),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: "food", label: "food",leadingIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/food.png',width: 50,height: 50,),
                      )),
                      DropdownMenuEntry(value: "bonus", label: "bonus",leadingIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/food.png',width: 50,height: 50,),
                      )),
                      DropdownMenuEntry(value: "ott", label: "ott",leadingIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/food.png',width: 50,height: 50,),
                      )),
                      DropdownMenuEntry(value: "salary", label: "salary",leadingIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/food.png',width: 50,height: 50,),
                      )),
                      DropdownMenuEntry(value: "travel", label: "travel",leadingIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/food.png',width: 50,height: 50,),
                      )),
                  DropdownMenuEntry(value: "expence", label: "expence"),
                ], hintText: "Catagory"),
              ),],
          ),
        ),
      ),
    );
  }
}

//CupertinoRadioChoice(
//     choices: {'male' : 'Male', 'female' : 'Female', 'other': 'Other'},
//     onChange: (selectedGender) {},
//     initialKeyValue: 'male')