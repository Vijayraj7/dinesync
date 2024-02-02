// import 'package:d_chart/d_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:workspotsadmin/Database/Fire/fireDB.dart';
// import 'package:workspotsadmin/Database/dataposting.dart';
// import 'package:workspotsadmin/Models/workspotsMenuhomeDelivery.dart';
// import 'package:workspotsadmin/Theme/appbar.dart';
// import 'package:workspotsadmin/Theme/fonts.dart';
// import 'package:workspotsadmin/WorkControllAdmin.dart';
// import 'package:workspotsadmin/main.dart';
// import 'package:time_chart/time_chart.dart';

// class HomeDeliveryAnalytics extends StatefulWidget {
//   const HomeDeliveryAnalytics({super.key});

//   @override
//   State<HomeDeliveryAnalytics> createState() => _HomeDeliveryAnalyticsState();
// }

// class _HomeDeliveryAnalyticsState extends State<HomeDeliveryAnalytics> {
//   Future<List<WorkspotsMenuHomeDelivery>> getemenus() async {
//     return workspotsMenuHomeDeliveryFromJsonList(
//         await FireDB.menuhomeOrderinstance.getallby(
//             {"spotid": WorkControllAdmin.instance.spot.value.id.toString()}));
//   }

//   int fut = 0;
//   DateTime time = DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar(title: "Analytics"),
//       body: FutureBuilder(
//         key: ValueKey(fut),
//         future: getemenus(),
//         builder: (c, s) {
//           if (s.hasData) {
//             var maindatax = s.data!;
//             var maintotdat =
//                 maindatax.where((e) => e.spotval == "f" && e.val == "d");
//             var graphx =
//                 maindatax.where((e) => e.spotfee != null && e.val == "d");
//             var remaing = maindatax
//                 .where((e) => e.spotval == "f" && e.val == "d")
//                 .toList();
//             var withrdat = maindatax
//                 .where((e) => e.spotval == "s" && e.val == "d")
//                 .toList();
//             var requestdat = maindatax
//                 .where((e) => e.spotval == "r" && e.val == "d")
//                 .toList();
//             int totalamount = 0;
//             int requestamount = 0;
//             int totalwithdrawel = 0;
//             int remaingamoun = 0;
//             // for (var mn in maintotdata) {
//             //   if (mn.spotfee != null) {
//             //     if (int.tryParse(mn.spotfee!) != null) {
//             //
//             //     }
//             //   }
//             // }
//             for (var rm in remaing) {
//               if (rm.spotfee != null) {
//                 if (int.tryParse(rm.spotfee!) != null) {
//                   remaingamoun += int.parse(rm.spotfee!);
//                 }
//               }
//             }
//             for (var rm in withrdat) {
//               if (rm.spotfee != null) {
//                 if (int.tryParse(rm.spotfee!) != null) {
//                   totalwithdrawel += int.parse(rm.spotfee!);
//                 }
//               }
//             }
//             for (var rm in requestdat) {
//               if (rm.spotfee != null) {
//                 if (int.tryParse(rm.spotfee!) != null) {
//                   requestamount += int.parse(rm.spotfee!);
//                 }
//               }
//             }
//             // totalwithdrawel = totalamount - remaingamoun;
//             var todaymnth = graphx
//                 .where((e) =>
//                     DateTime.parse(e.createdAt!).year == time.year &&
//                     DateTime.parse(e.createdAt!).month == time.month)
//                 .toList();
//             totalamount = totalwithdrawel + requestamount;
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(height: 13.h),
//                   gridtree(children: [
//                     topbot("₹$remaingamoun", "Withdrawal Amount"),
//                     topbot("₹$totalwithdrawel", "Total Withdrawal"),
//                     topbot("₹$totalamount", "Total Earning"),
//                     topbot("₹$requestamount", "Requested Amount"),
//                   ], count: 2),
//                   if (remaingamoun > 0)
//                     Container(
//                       width: 200.w,
//                       child: ElevatedButton(
//                           onPressed: () async {
//                             Get.generalDialog(
//                               pageBuilder: (c, cc, ccc) {
//                                 return AlertDialog(
//                                   title: Text("Withdraw ₹$remaingamoun "),
//                                   content: Text(
//                                       "Your amount will be credited to your bank account in 1 day"),
//                                   actions: [
//                                     TextButton(
//                                         onPressed: () {
//                                           Navigator.pop(c);
//                                         },
//                                         child: Text("cancel")),
//                                     TextButton(
//                                         onPressed: () async {
//                                           Navigator.pop(c);
//                                           await FireDB.menuhomeOrderinstance
//                                               .column("spotval")
//                                               .row(
//                                                   'spotid',
//                                                   WorkControllAdmin
//                                                       .instance.spot.value.id
//                                                       .toString())
//                                               .setstring("r", dat: {
//                                             'spotval': 'f',
//                                             'val': 'd',
//                                             // 'spotfee': '108'
//                                           });
//                                           printer("object");
//                                           setState(() {
//                                             fut++;
//                                           });
//                                         },
//                                         child: Text("withdraw")),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           style:
//                               ElevatedButton.styleFrom(shape: StadiumBorder()),
//                           child: Text("Withdraw ₹$remaingamoun")),
//                     ),
//                   // TimeChart(
//                   //   data: [
//                   //     DateTimeRange(
//                   //       start: DateTime(2021, 2, 24, 23, 15),
//                   //       end: DateTime(2021, 2, 25, 7, 30),
//                   //     ),
//                   //     DateTimeRange(
//                   //       start: DateTime(2021, 2, 22, 1, 55),
//                   //       end: DateTime(2021, 2, 22, 9, 12),
//                   //     ),
//                   //     DateTimeRange(
//                   //       start: DateTime(2021, 2, 20, 0, 25),
//                   //       end: DateTime(2021, 2, 20, 7, 34),
//                   //     ),
//                   //     DateTimeRange(
//                   //       start: DateTime(2021, 2, 17, 21, 23),
//                   //       end: DateTime(2021, 2, 18, 4, 52),
//                   //     ),
//                   //     DateTimeRange(
//                   //       start: DateTime(2021, 2, 13, 6, 32),
//                   //       end: DateTime(2021, 2, 13, 13, 12),
//                   //     ),
//                   //     DateTimeRange(
//                   //       start: DateTime(2021, 2, 1, 9, 32),
//                   //       end: DateTime(2021, 2, 1, 15, 22),
//                   //     ),
//                   //     DateTimeRange(
//                   //       start: DateTime(2021, 1, 22, 12, 10),
//                   //       end: DateTime(2021, 1, 22, 16, 20),
//                   //     ),
//                   //   ],
//                   //   viewMode: ViewMode.weekly,
//                   // ),
//                   Container(
//                     height: 260.h,
//                     // width: 300.w,
//                     child: DChartLine(
//                       includeArea: true,
//                       includePoints: true,
//                       data: [
//                         {
//                           'id': 'Line',
//                           'data': [
//                             for (var i = 0; i < 30; i++)
//                               {
//                                 'domain': (i + 1),
//                                 'measure': getint(todaymnth, (i + 1))
//                               },
//                           ],
//                         },
//                       ],
//                       lineColor: (lineData, index, id) => Colors.amber,
//                     ),
//                   ),
//                   OutlinedButton(
//                       onPressed: () async {
//                         var rd = await showDatePicker(
//                             context: context,
//                             initialDate: time,
//                             firstDate: DateTime(2000),
//                             lastDate: DateTime(2050));
//                         if (rd != null) {
//                           time = rd;
//                         }
//                         setState(() {
//                           fut++;
//                         });
//                       },
//                       child: Text(DateFormat.yMMM().format(time))),
//                   SizedBox(height: 400.h),
//                 ],
//               ),
//             );
//           } else {
//             return Container(
//               height: 300,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget topbot(String top, String bot) {
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.all(8.r),
//         height: 150.h,
//         child: Card(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   top.toString(),
//                   style: Fonts.normal(
//                       style: TextStyle(
//                     fontSize: 23.sp,
//                   )),
//                 ),
//                 Text(
//                   bot.toString(),
//                   style: Fonts.normal(
//                       style: TextStyle(
//                     fontSize: 14.sp,
//                   )),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// getint(List<WorkspotsMenuHomeDelivery> today, int day) {
//   int tot = 0;
//   var daym =
//       today.where((e) => DateTime.parse(e.createdAt!).day == day).toList();
//   for (var das in daym) {
//     if (das.spotfee != null) {
//       if (int.tryParse(das.spotfee!) != null) {
//         tot += int.parse(das.spotfee!);
//       }
//     }
//   }
//   return tot;
// }
