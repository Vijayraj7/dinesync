import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as di;

// import 'enc.dart';

// import 'package:turn/MyDatabase/fcmsend.dart';
load() {
  WidgetsBinding.instance.addPostFrameCallback((_) async {});
}

Widget loader() {
  return Container(
      width: double.infinity,
      child: Center(
        child: Container(
            height: 10, width: 10, child: CircularProgressIndicator()),
      ));
}

Future<String> postquery(String query, String sharedkey,
    {String postkey = '',
    bool listenToLocal = false,
    String defualtd = '[]'}) async {
  String qr = query;

  String v = "https://pdfmk.netfish.in/public/api/query";
  printer(v);
  String apikey = "qwfghbtgute";
  String apivalue = "ZHDsKGDIaVZ9MGXsbqK6XupKWFT0A/DyYSKuldoTXsA=";
  try {
    var re = await http.post(
      Uri.parse(v),
      body: {
        apikey: apivalue,
        'query': qr,
      },
    );
    printer(re.body);
    return re.body.toString();
  } catch (e) {
    printer(e);
    if (sharedkey == '') {
      printer("l-l-l-9-");
      printer('ffff');
      printer("l-l-l-l-");

      return "fff";
    } else {
      return defualtd;
    }
  }
}

Future<String> postFile(File file, String name) async {
  load();
  String query = '''

        if(\$request->hasFile("image")) {

            \$image = \$request->file("image");
            \$name = time()."_".\$request->post('name');
            \$path =   \$image->storeAs("images/$name", \$name, "res_disk");
        
        }




     return "https://res.workspots.in/public/files/".\$path;

''';
  String qr = query;
  String v = "https://pdfmk.netfish.in/public/api/query";
  String apikey = "qwfghbtgute";
  String apivalue = "ZHDsKGDIaVZ9MGXsbqK6XupKWFT0A/DyYSKuldoTXsA=";

  try {
    String name = Random().nextInt(99999999).toString() +
        '.' +
        file.path.split('/').last.split('.').last;
    var data = di.FormData.fromMap({
      apikey: apivalue,
      'query': qr,
      'name': name,
      "image": await di.MultipartFile.fromFile(
        file.path,
        filename: name,
      ),
    });
    ;
    di.Dio dio = new di.Dio();
    var res = await Get.showOverlay<String>(
        opacity: 0,
        loadingWidget: loader(),
        asyncFunction: () async {
          var re = await dio.post(
            v,
            data: data,
          );
          return re.data;
        });

    printer("url--");
    printer(res);
    printer("url--");
    printer(res);
    printer("url--");

    return res;
  } catch (e) {
    printer(e);
    printer('ffqwq---wqwwqwq---');
    printer(e);

    return 'f';
  }
}

Future<String> postFileNEW(File file, String name) async {
  load();
  String query = '''

        if(\$request->hasFile("image")) {

            \$image = \$request->file("image");
            \$name = time()."_".\$request->post('name');
            \$path =   \$image->storeAs("$name", \$name, "res_disk");
        
        }




     return "https://res.workspots.in/public/files/".\$path;

''';
  String qr = query;
  String v = "https://pdfmk.netfish.in/public/api/query";
  String apikey = "qwfghbtgute";
  String apivalue = "ZHDsKGDIaVZ9MGXsbqK6XupKWFT0A/DyYSKuldoTXsA=";

  try {
    String name = Random().nextInt(99999999).toString() +
        '.' +
        file.path.split('/').last.split('.').last;
    var data = di.FormData.fromMap({
      apikey: apivalue,
      'query': qr,
      'name': name,
      "image": await di.MultipartFile.fromFile(
        file.path,
        filename: name,
      ),
    });
    ;
    di.Dio dio = new di.Dio();
    var res = await Get.showOverlay<String>(
        opacity: 0,
        loadingWidget: loader(),
        asyncFunction: () async {
          var re = await dio.post(
            v,
            data: data,
          );
          return re.data;
        });

    printer("url--");
    printer(res);
    printer("url--");
    printer(res);
    printer("url--");

    return res;
  } catch (e) {
    printer(e);
    printer('ffqwq---wqwwqwq---');
    printer(e);

    return 'f';
  }
}

Future<String> deleteFile(String name) async {
  var cnt = name.split("/").length;
  var ur = name.split("/");
  var url = ur[cnt - 2] + "/" + ur[cnt - 1];
  printer(url);
  load();
  String query = '''

    

    
    
         return   Storage::disk('res_disk')->delete('images/$url');
        
        
    






''';
  String qr = query;
  String v = "https://pdfmk.netfish.in/public/api/query";
  String apikey = "qwfghbtgute";
  String apivalue = "ZHDsKGDIaVZ9MGXsbqK6XupKWFT0A/DyYSKuldoTXsA=";

  try {
    var data = di.FormData.fromMap({
      apikey: apivalue,
      'query': qr,
    });

    di.Dio dio = new di.Dio();
    var res = await Get.showOverlay<String>(
        opacity: 0,
        loadingWidget: loader(),
        asyncFunction: () async {
          var re = await dio.post(v, data: data);
          return re.data;
        });

    printer("url--");
    printer(res);
    printer("url--");
    printer(res);
    printer("url--");

    return res;
  } catch (e) {
    printer(e);
    printer('ffqwq---wqwwqwq---');
    printer(e);

    return 'f';
  }
}

void printer(object) {}
void printer2(object) {
  print(object);
}
