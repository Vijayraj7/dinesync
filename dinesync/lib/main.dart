import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:dinesync/Theme/fonts.dart';
import 'package:dinesync/firebase_options.dart';
import 'package:dinesync/layouts/AccountLayout/AccountPage/accountbody.dart';
import 'package:dinesync/layouts/adminlay/adminlay.dart';
import 'package:dinesync/layouts/signin.dart';
import 'package:dinesync/layouts/userlay/userlay.dart';
import 'package:dinesync/models/workspotsaccount.dart';
import 'package:dinesync/oper.dart';
import 'package:location/location.dart';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:dinesync/Database/Fire/fireDB.dart';

import 'package:dinesync/Database/dataposting.dart';

import 'workcontroll.dart';
export 'workcontroll.dart';

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

bool _flexibleUpdateAvailable = false;

//
//
//
//

const int _blackPrimaryValue = 0xFF000000;
const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

class ScollGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return StretchingOverscrollIndicator(
        axisDirection: AxisDirection.down, child: child);
  }
}

PageController pcontrol = PageController(keepPage: false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await GetStorage.init();

  Get.put(WorkControll());
  try {} catch (e) {}

  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.black, primarySwatch: primaryBlack),
      debugShowCheckedModeBanner: false,
      title: 'Workspots',
      home: ScreenUtilInit(
        designSize: const Size(392.7, 802.9),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (c, w) {
          return Oper(
            child: MainApp(),
          );
        },
      ),
    ),
  );
}

//

//

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

Future<void> initUniLinks() async {
  printer("initialLink");
}

const String _isolateName = "LocatorIsolate";
ReceivePort port = ReceivePort();

var fir = FirebaseRemoteConfig.instance.getInt("firstint");
var sec = FirebaseRemoteConfig.instance.getInt("secondint");

class _MainAppState extends State<MainApp> {
  void geted() async {
    WorkControll.instance.user.value =
        workspotsAccountFromJson(await FireDB.accountinstance.getoneby({
      'name': GetStorage().read('us'),
      'password': GetStorage().read('ps'),
    }));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (GetStorage().hasData('login')) {
        geted();
      }
      if (WorkControll.instance.user.value.follows != null) {
        if (WorkControll.instance.user.value.follows!.length > 2) {
          setState(() {
            WorkControll.instance.currentpage.value = fir;
          });
        } else {
          setState(() {
            WorkControll.instance.currentpage.value = sec;
          });
        }
      }
    });

    super.initState();
    init();
  }

  init() async {}

  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await initControll(WorkControll.instance);
      });
    }

    return GetStorage().hasData('login')
        ? Obx(() => WorkControll.instance.user.value.isuser == "s"
            ? AccountBody()
            : AccountBody())
        : SigningLayout(
            onset: () {
              setState(() {});
            },
          );
  }
}

class LoginKEy {
  static String phon = "cphone";
}

setbgloc() async {
  for (var i = 0; i < 100; i++) {
    await Future.delayed(Duration(seconds: 4));
  }
}
