import 'dart:async';
import 'package:dinesync/Database/myTable.dart';

class MyDatabase {
  String dName = 'spots';
  String? dTablename;
  String query = '';
  String sharedkey = '';
  MyDatabase(this.dName);
  MyTable table(String tablename) {
    dTablename = tablename;
    sharedkey += dName;
    sharedkey += tablename;
    return MyTable(
      dName: dName,
      dTablename: tablename,
      query: query,
      sharedkey: sharedkey,
    );
  }
}
