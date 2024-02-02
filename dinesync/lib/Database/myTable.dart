import 'dart:async';

import 'package:get/get.dart';
import 'package:dinesync/Database/actiondata.dart';
import 'package:dinesync/Database/dataposting.dart';
import 'package:dinesync/Database/myColumn.dart';
// import 'package:dinesync/workcontroll.dart';

// import 'mySchools.dart';

class MyTable {
  String dName;
  String dTablename;
  String? dColumname;
  String query;
  String sharedkey;
  MyTable({
    required this.dName,
    required this.dTablename,
    required this.query,
    required this.sharedkey,
  });
  MyColumn column(String columnname) {
    sharedkey += columnname;
    dColumname = columnname;
    return MyColumn(
      dName: dName,
      dTablename: dTablename,
      dColumnname: columnname,
      query: query,
      sharedkey: sharedkey,
    );
  }

  Future<String> set(Map data,
      {String key = '', bool isoverlay = true, String value = ''}) async {
    String squery = '';
    // squery += ActionSchools.checktable(dName, dTablename);
    squery +=
        ActionSchools.settable(dName, dTablename.toString(), data, key, value);
    squery += 'return response("success");';
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
        },
      );
      // await initControll(WorkControll.instance);
      return s;
    }
  }

  Future<String> del(Map data, {String key = '', String value = ''}) async {
    String squery = '';
    // squery += ActionSchools.checktable(dName, dTablename);
    squery += ActionSchools.delttable(dName, dTablename.toString(), data);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey);
    return s;
  }

  Future<String> getall({String postkey = ''}) async {
    String squery = '';
    squery += ActionSchools.getableall(dName, dTablename);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey);
    return s;
  }

  Future<String> getalldupesbycolumn(String col, {String postkey = ''}) async {
    String squery = '';
    squery += ActionSchools.getablealldupebycol(col, dName, dTablename);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey);
    return s;
  }

  Future<String> getallbydistance(
      {required double clat,
      required double clng,
      required double distance,
      String postkey = ''}) async {
    String squery = '';
    squery += ActionSchools.getableallbydistance(
        dName, dTablename, clat, clng, distance);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey);
    return s;
  }

  Future<String> getallbydistanceby(Map data,
      {required double clat,
      required double clng,
      required double distance,
      String postkey = ''}) async {
    String squery = '';
    squery += ActionSchools.getableallbydistanceby(
        data, dName, dTablename, clat, clng, distance);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey);
    return s;
  }

  Future<String> getoneby(Map data,
      {String postkey = '',
      bool listenToLocal = false,
      String defaultd = '{}'}) async {
    String squery = '';
    squery += ActionSchools.getoneby(dName, dTablename, data);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal, defualtd: defaultd);
    return s;
  }

  Future<String> getallby(Map data,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallby(dName, dTablename, data);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbyorder(Map data, String orderstr,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbyoder(dName, dTablename, data, orderstr);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbyordercount(Map data, int limit,
      {String postkey = '',
      String orderstr = 'created_at',
      bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbyodercount(
        limit, dName, dTablename, data, orderstr);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbyorderkeyrev(Map data, String orderstr,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery +=
        ActionSchools.getallbyoderkeyrev(dName, dTablename, data, orderstr);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbystrict(Map data,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbystrict(dName, dTablename, data);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbycountrandom(Map data, int limit,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbyrandom(dName, dTablename, data, limit);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbycountrandomwithoutdata(Map data, int limit,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery +=
        ActionSchools.getallbyrandomwithoutdata(dName, dTablename, data, limit);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbycountrandomwithoutdatakeyrev(int limit,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery +=
        ActionSchools.getallbyrandomwithoutdatakeyrev(dName, dTablename, limit);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbycountrandomorderby(Map data, int limit, String orderby,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbyrandomorderby(
        dName, dTablename, data, limit, orderby);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbycountrandomorderbykeyrev(
      Map data, int limit, String orderby,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbyrandomorderbykeyrev(
        dName, dTablename, data, limit, orderby);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbycountrandomorderbykeyrevrl(
      Map data, int limit, String orderby,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbyrandomorderbykeyrev(
        dName, dTablename, data, limit, orderby);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbylike(Map data,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbylike(dName, dTablename, data);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbylikerev(Map data,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery += ActionSchools.getallbylikerev(dName, dTablename, data);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getallbylikecounterandom(Map data, int limit,
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    squery +=
        ActionSchools.getallbylikecountrandom(dName, dTablename, data, limit);
    squery += 'return response("success");';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getdatenow(
      {String? format, String postkey = '', bool listenToLocal = false}) async {
    String squery = '';
    if (format != null) {
      squery += "\$dat = date('$format');";
    } else {
      squery += "\$dat = date('Y-m-d H:i:s');";
    }
    squery += 'return \$dat;';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }

  Future<String> getuniqnow(
      {String postkey = '', bool listenToLocal = false}) async {
    String squery = '';

    squery += 'return uniqid();';
    var s = await postquery(squery, sharedkey,
        postkey: postkey, listenToLocal: listenToLocal);
    return s;
  }
}
