import 'dart:async';

import 'package:dinesync/Database/actiondata.dart';
import 'package:dinesync/Database/dataposting.dart';
import 'package:dinesync/Database/myRow.dart';
// import 'package:dinesync/workcontroll.dart';

import 'mySchools.dart';

class MyColumn {
  String dName;
  String dTablename;
  String dColumnname;
  String query;
  String sharedkey;
  MyColumn({
    required this.dName,
    required this.dTablename,
    required this.dColumnname,
    required this.query,
    required this.sharedkey,
  });
  MyRow row(
    String key,
    String value,
  ) {
    if (key != '') {
      sharedkey += key;
      sharedkey += value;
    }
    return MyRow(
      dName: dName,
      dTablename: dTablename,
      dColumnname: dColumnname,
      query: query,
      key: key,
      value: value,
      sharedkey: sharedkey,
    );
  }

  MyRow pushrow() {
    String key = '';
    String value = '';
    if (key != '') {
      sharedkey += key;
      sharedkey += value;
    }
    return MyRow(
      dName: dName,
      dTablename: dTablename,
      dColumnname: dColumnname,
      query: query,
      key: key,
      value: value,
      sharedkey: sharedkey,
    );
  }

  // Future<void> set(Object data) async {
  //   String squery = '';
  //   squery += ActionSchools.checktable(dName, dTablename);
  //   squery +=
  //       ActionColumn.checkcolumn(dName, dTablename.toString(), dColumnname);
  //   squery += 'return response("success");';
  //   await postquery(squery, sharedkey);
  //   // await initControll(WorkControll.instance);
  // }

  Future<String> getall() async {
    String squery = '';
    // squery += ActionSchools.checktable(dName, dTablename);
    squery +=
        ActionColumn.getcolumnall(dName, dTablename.toString(), dColumnname);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey);
    return s;
  }

  Future<String> getby(String key, String value) async {
    String squery = '';
    // squery += ActionSchools.checktable(dName, dTablename);
    squery +=
        ActionColumn.getcolumnall(dName, dTablename.toString(), dColumnname);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey);
    return s;
  }
}
