import 'dart:async';

import 'package:dinesync/Database/actiondata.dart';
import 'package:dinesync/Database/dataposting.dart';
import 'package:flutter/material.dart';
// import 'package:dinesync/workcontroll.dart';

import 'mySchools.dart';

class MyChild {
  String dName;
  String dTablename;
  String dColumnname;
  // String childn;
  String query;
  String last;
  String key;
  String value;
  String sharedkey;
  MyChild({
    required this.dName,
    required this.dTablename,
    required this.dColumnname,
    // required this.childn,
    required this.query,
    required this.last,
    required this.key,
    required this.value,
    required this.sharedkey,
  });
  MyChild child(String childname) {
    sharedkey += childname;
    // last += '["$childname"]';
    last += "['$childname']";
    return this;
  }

  Future<String> set(Object data) async {
    query += ActionChild.thirdchild(
        dName, dTablename, dColumnname, key, value, data, last);
    String squery = '';
    squery += ActionSchools.checktable(dName, dTablename);
    squery +=
        ActionColumn.checkcolumn(dName, dTablename.toString(), dColumnname);
    squery += query;
    String s = await postquery(squery, sharedkey);
    return s;
  }

  Future<String> add(Object data) async {
    query += ActionChild.thirdchildADd(
        dName, dTablename, dColumnname, key, value, data, last);
    String squery = '';
    squery += ActionSchools.checktable(dName, dTablename);
    squery +=
        ActionColumn.checkcolumn(dName, dTablename.toString(), dColumnname);
    squery += query;
    String s = await postquery(squery, sharedkey);
    return s;
  }

  // Future<String> add(Object data) async {
  //   query += ActionChild.thirdchildADd(
  //       dName, dTablename, dColumnname, key, value, data, last);
  //   String squery = '';
  //   squery += ActionSchools.checktable(dName, dTablename);
  //   squery +=
  //       ActionColumn.checkcolumn(dName, dTablename.toString(), dColumnname);
  //   squery += query;
  //   String s = await postquery(squery, sharedkey);
  //   return s;
  // }

  Future<String> get() async {
    query += ActionChild.thirdchildGet(
      dName,
      dTablename,
      dColumnname,
      key,
      value,
      last,
    );
    String squery = '';
    squery += ActionSchools.checktable(dName, dTablename);
    squery +=
        ActionColumn.checkcolumn(dName, dTablename.toString(), dColumnname);
    squery += query;
    String s = await postquery(squery, sharedkey);
    return s;
  }

  Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield i++;
      if (i == maxCount) break;
    }
  }
}
