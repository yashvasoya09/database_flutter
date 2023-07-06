import 'package:database_flutter/screen/controller/DB_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}
DB_controller db_controller = Get.put(DB_controller());
Map<String, double> dataMap = {

  "expense ":db_controller.expence,"income":db_controller.income
};
class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    db_controller.check();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Your Money Cracker",style: GoogleFonts.play(color: Colors.black,fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {Get.toNamed('add');
            },icon: Icon(CupertinoIcons.add,color: Colors.black)),
          ),
        ],),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xffEEE5FF)),child:
              TextField(
                style: GoogleFonts.playfairDisplaySc(color: Color(0xff7F3DFF),fontSize: 20),
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(CupertinoIcons.right_chevron,color: Color(0xff7F3DFF)),
                  ),
                  hintText: "See your financial report",
                    hintStyle: GoogleFonts.playfairDisplaySc(color: Color(0xff7F3DFF),fontSize: 20),
                    border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20))),
              ),
               ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Spend Frequency",style: GoogleFonts.play(color: Colors.black,fontSize: 25),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: [Colors.red,Colors.green],
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                centerText: "Income Expence",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("You Save ${db_controller.total}",style: GoogleFonts.play(color: Colors.green,fontSize: 25)),
                ),
              ],
            ),
                        SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Recent Transaction",style: GoogleFonts.play(color: Colors.black,fontSize: 25),),
                  Spacer(),
                  Container(height: 25,width: 60,decoration: BoxDecoration(color: Color(0xffEEE5FF),borderRadius: BorderRadius.circular(20)),
                      child: Center(  child: Text("See All",style: GoogleFonts.play(color: Color(0xff7F3DFF),fontSize: 15),))),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("${db_controller.data[index].name}",style: GoogleFonts.play()),
                    leading: Image.asset("${db_controller.data[index].img}"),
                    trailing: Container(height: 25,width: 60,decoration: BoxDecoration(color: db_controller.data[index].status=="income"?Colors.green:Colors.red,borderRadius: BorderRadius.circular(20)),
                        child: Center(  child: Text("${db_controller.data[index].amount}",style: GoogleFonts.play(color: Color(0xffEEE5FF),fontSize: 15),))),
                  ),
                );
              },itemCount: db_controller.data.length),
            ),
          ],
        ),
      )
    );
  }
}
