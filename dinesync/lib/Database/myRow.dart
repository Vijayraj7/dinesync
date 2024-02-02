import 'dart:async';

import 'package:get/get.dart';
import 'package:dinesync/Database/actiondata.dart';
import 'package:dinesync/Database/dataposting.dart';
import 'package:dinesync/Database/myChild.dart';
import 'package:dinesync/main.dart';

import 'mySchools.dart';

class MyRow {
  String dName;
  String dTablename;
  String dColumnname;
  String key = '';
  String value = '';
  String query = '';
  String last = '';
  String sharedkey;
  MyRow({
    required this.dName,
    required this.dTablename,
    required this.dColumnname,
    required this.query,
    required this.key,
    required this.value,
    required this.sharedkey,
  });

  MyChild child(String childname) {
    sharedkey += childname;
    query += ActionChild.firstchild(
      dName,
      dTablename,
      dColumnname,
      key,
      value,
    );
    // last += '["$childname"]';
    last += "['$childname']";
    return MyChild(
        dName: dName,
        dTablename: dTablename,
        dColumnname: dColumnname,
        query: query,
        last: last,
        key: key,
        value: value,
        // childn: childname,
        sharedkey: sharedkey);
  }

  MyChild echild() {
    // sharedkey += childname;
    query += ActionChild.firstchild(
      dName,
      dTablename,
      dColumnname,
      key,
      value,
    );
    // last += '["$childname"]';
    last += "";
    return MyChild(
        dName: dName,
        dTablename: dTablename,
        dColumnname: dColumnname,
        query: query,
        last: last,
        key: key,
        value: value,
        // childn: childname,
        sharedkey: sharedkey);
  }

  Future<String> getallchild() async {
    // sharedkey += childname;
    // query += ActionChild.getAllchild(
    //   dName,
    //   dTablename,
    //   dColumnname,
    //   key,
    //   value,
    //   // childname,
    // );
    String squery = ActionChild.getAllchild(
      dName,
      dTablename,
      dColumnname,
      key,
      value,
      // childname,
    );
    // squery += ActionSchools.checktable(dName, dTablename);
    // squery +=
    //     ActionColumn.getcolumnall(dName, dTablename.toString(), dColumnname);
    // squery += 'return response("success");';
    var s = await postquery(squery, sharedkey);
    return s;
  }

  Future<String> set(Object rowdata, {bool? isoverlay}) async {
    String squery = '';
    squery += ActionSchools.checktable(dName, dTablename);
    squery +=
        ActionColumn.checkcolumn(dName, dTablename.toString(), dColumnname);
    squery += ActionRow.checkrow(
        dName, dTablename.toString(), dColumnname, rowdata, key, value);
    // squery += 'return response("success");';
    if (isoverlay == false) {
      var d = await postquery(squery, sharedkey);
      return d;
    } else {
      var s = Get.showOverlay<String>(
          loadingWidget: loader(),
          opacity: 0.0,
          asyncFunction: () async {
            var d = await postquery(squery, sharedkey);
            return d;
          });
      return s;
    }
    // await initControll(WorkControll.instance);
  }

  Future<String> setstring(Object rowdata, {bool? isoverlay}) async {
    String squery = '';
    squery += ActionSchools.checktable(dName, dTablename);
    squery +=
        ActionColumn.checkcolumn(dName, dTablename.toString(), dColumnname);
    squery += ActionRow.checkrowstring(
        dName, dTablename.toString(), dColumnname, rowdata, key, value);
    // squery += 'return response("success");';
    if (isoverlay == false) {
      var d = await postquery(squery, sharedkey);
      return d;
    } else {
      var s = Get.showOverlay<String>(
          loadingWidget: loader(),
          opacity: 0.0,
          asyncFunction: () async {
            var d = await postquery(squery, sharedkey);
            return d;
          });
      return s;
    }
  }
}
