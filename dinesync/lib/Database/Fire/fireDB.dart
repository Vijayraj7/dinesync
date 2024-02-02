// import 'package:flutter/foundation.dart';
import 'package:dinesync/Database/mySchools.dart';
import 'package:dinesync/Database/myTable.dart';

bool kDebugMod = false;

/// Original
class FireDB {
  static MyTable get spotinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxspots')
      : MyDatabase('mysql').table('spots');
  static MyTable get requestspotinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxrequestspots')
      : MyDatabase('mysql').table('requestspots');
  static MyTable get postinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxdemoposts')
      : MyDatabase('mysql').table('posts');
  static MyTable get wwdinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxwhatwedo')
      : MyDatabase('mysql').table('whatwedo');
  static MyTable get accountinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxaccounts')
      : MyDatabase('mysql').table('accounts');
  static MyTable get promoteinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxpromts')
      : MyDatabase('mysql').table('promts');
  static MyTable get requestinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxprequests')
      : MyDatabase('mysql').table('prequests');
  static MyTable get messageinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxmessages')
      : MyDatabase('mysql').table('messages');
  static MyTable get wrequestinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxwrequests')
      : MyDatabase('mysql').table('wrequests');
  static MyTable get webinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxwebs')
      : MyDatabase('mysql').table('webs');
  static MyTable get webrequestinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxwebrqsts')
      : MyDatabase('mysql').table('webrqsts');
  static MyTable get contactinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxcontact')
      : MyDatabase('mysql').table('contact');
  static MyTable get topadinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxtopad')
      : MyDatabase('mysql').table('topad');
  static MyTable get sectioninstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxsection')
      : MyDatabase('mysql').table('section');
  static MyTable get eventinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxevents')
      : MyDatabase('mysql').table('events');
  static MyTable get menuinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxmenus')
      : MyDatabase('mysql').table('menus');
  static MyTable get menuOrderinstance => kDebugMod
      ? MyDatabase('mysql').table('zzxxxmenusorder')
      : MyDatabase('mysql').table('menusorder');
}
