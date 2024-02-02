import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinesync/Theme/gridtreeselect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as parser;
// import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:dinesync/Cards/RequestCards/productrequestcard.dart';
import 'package:dinesync/Database/dataposting.dart';
// import 'package:dinesync/Layouts/NewPost/newpost.dart';
// import 'package:dinesync/Theme/gridtreeselect.dart';
import 'package:dinesync/Theme/showsnack.dart';
import 'package:dinesync/main.dart';

class SearchImageOne extends StatefulWidget {
  const SearchImageOne({super.key, required this.onSelect, required this.str});
  final void Function(String url) onSelect;
  final String str;

  @override
  State<SearchImageOne> createState() => _SearchImageOneState(str);
}

class _SearchImageOneState extends State<SearchImageOne> {
  _SearchImageOneState(this.str);
  String str;
  List<String> selected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async {
      //     if (selected.isNotEmpty) {
      //       List<String> uls = [];
      //       await Get.showOverlay(
      //         opacity: 0.1,
      //         opacityColor: Colors.black,
      //         loadingWidget: loader(),
      //         asyncFunction: () async {
      //           // List<XFile> uls = [];
      //           for (var i = 0; i < selected.length; i++) {
      //             // var i = 0;
      //             var url = Uri.parse(selected[i]);
      //             var response = await http.get(url);
      //             Directory extDir = await getApplicationDocumentsDirectory();
      //             var ul = extDir.path +
      //                 '/Temp/${Random().nextInt(1000)}_${Random().nextInt(1000)}.jpeg';
      //             var isxt = await File(ul).exists();
      //             if (!isxt) {
      //               await File(ul).create(recursive: true);
      //             }
      //             await File(ul).writeAsBytes(response.bodyBytes);
      //             // uls.add(ul);
      //             uls.add(ul);
      //           }
      //         },
      //       );
      //       Get.to(NewPost(listimages: uls));
      //     } else {
      //       showsnack("select images");
      //     }
      //   },
      //   label: Text("Create Product"),
      // ),
      appBar: AppBar(
        // actions: [
        //   // if (selected.isNotEmpty)
        //   IconButton(
        //       onPressed: () {}, icon: Icon(Icons.done, color: Colors.blue))
        // ],
        backgroundColor: Colors.black,
        toolbarHeight: 60.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          splashRadius: 25.r,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: TextFormField(
          initialValue: str,
          autofocus: true,
          onChanged: (s) {
            if (s.length > 2) {
              setState(() {
                str = s;
              });
            }
          },
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: " Search images...",
            border: InputBorder.none,
            // prefix: IconButton(
            //   icon: Icon(Icons.search),
            //   color: Color.fromRGBO(93, 25, 72, 1),
            //   onPressed: () {},
            // ),
            hintStyle: TextStyle(color: Colors.white60),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: getimgs(str),
        builder: (c, s) {
          if (s.hasData) {
            var imgs = s.data!.reversed.toList();
            if (imgs.isNotEmpty) {
              return gridtreeSelect(
                  imgs: imgs,
                  onSelect: (select) {
                    // setState(() {
                    selected = select;
                    if (select.isNotEmpty) {
                      widget.onSelect(select[0]);
                    }
                    // });
                  },
                  children: [
                    for (var m in imgs)
                      Container(
                          padding: EdgeInsets.all(4),
                          child: CachedNetworkImage(
                            imageUrl: m,
                            height: 100.h,
                            fit: BoxFit.contain,
                          )),
                    for (var m in [1, 2, 3, 4, 5])
                      Container(
                        height: 50.h,
                      )
                  ],
                  count: 3);
            } else {
              return Container();
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<String>> getimgs(String st) async {
    selected.clear();
    List<String> limgs = [];
    if (st.length > 2) {
      final response = await http
          .get(Uri.parse('https://www.bing.com/images/search?q=' + st));
      final document = parser.parse(response.body);
      final elements = document.querySelectorAll('img');
      final list =
          elements.map((element) => element.attributes['src']).toList();
      for (var fv in list) {
        if (fv != null) {
          if (fv.startsWith("http")) {
            limgs.add(fv);
          }
        }
      }
    }
    return limgs;
  }
}
