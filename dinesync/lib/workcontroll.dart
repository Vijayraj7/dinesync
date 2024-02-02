import 'package:dinesync/Models/workspotsMenu.dart';
import 'package:dinesync/models/workspotsaccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dinesync/Database/Fire/fireDB.dart';

class WorkControll extends GetxController {
  static WorkControll get instance => Get.find();
  RxInt currentpage = 0.obs;
  Rx<Color> bcolor = Colors.white.obs;
  RxBool isinited = false.obs;
  Rx<WorkspotsAccount> user = WorkspotsAccount().obs;
  RxBool isMuted = false.obs;

  @override
  void onInit() async {
    await initControll(this);
    super.onInit();
  }
}

Map<dynamic, dynamic> getfollows() {
  Map<dynamic, dynamic> fs = {};
  // for (var e in WorkControll.instance.user.value.follows ?? []) {
  //   fs.addAll({e.toString(): "spotid"});
  // }
  return fs;
}

initControll(WorkControll th) async {
  // th.spot.value = workspotsSpotsFromJson(
  //     await FireDB.spotinstance.getoneby({'email': FirebaseSuser.email}));
  // th.posts.value =
  //     workspotsPostsFromJsonList(await FireDB.postinstance.getall());
  if (getfollows().isNotEmpty) {
  } else {
    // th.followposts.value = workspotsPostsFromJsonList(
    //     await FireDB.postinstance.getallbycountrandomorderby({}, 5, "likes"));
    // th.followposts.shuffle();
  }
  // th.works.value =
  //     workspotsWhatWeDoFromJsonList(await FireDB.wwdinstance.getall());

  // th.wrqsts.value = workspotPostRequestFromJsonList(
  //     await FireDB.wrequestinstance.getallbyorder(
  //         {'accid': LocalDB.instance.user.value.id.toString()}, 'created_at'));

  // if (th.isinited.value == false) {
  //   updateInterest();
  // }
  // else {
  //   GetStorage().write(GetSkeys.pdatchanges, Random().nextInt(1000).toString());
  // }
  // printer()
  th.isinited.value = true;
}

// class StretchingOverscrollIndicator {}
// class WillPopScope {}

toqr(String s) async {
  var splits = s.split("/");
  if (splits.length > 4) {
    splits.removeAt(0);
    splits.removeAt(0);
    splits.removeAt(0);
    // splits.removeAt(2);
    var key = splits[0].toString();
    splits.removeAt(0);
    var value = splits[0].toString();
    // var va = "";
    // for (var i = 0; i < splits.length; i++) {
    //   if (i == (splits.length - 1)) {
    //     va += splits[i];
    //   } else {
    //     va += "${splits[i]}/";
    //   }
    // }
    if (key == UrlKeys.menu) {
      var spt = workspotsMenuFromJsonList(
          await FireDB.menuinstance.getallby({'uid': value}));
      // var ds = WorkControll.instance.rqsts
      //     .firstWhereOrNull((e) => e.id.toString() == value);
      if (spt.isNotEmpty) {
        // var spot = workspotsSpotsFromJson(await FireDB.spotinstance
        //     .getoneby({'id': pst[0].spotid.toString()}));
        String? orderTab;
        if (splits.length > 1) {
          orderTab = splits[1].toString();
        }
        // Get.to(MenuLayout(
        //   menu: spt[0],
        //   orderTab: orderTab,
        // ));
        // Get.to(ProductOrderDetail(rqst: ds));
      } else {
        // printer(value);
        // printer(value);
        // printer(value);
        // Get.back();
      }
    }
  }
}

class UrlKeys {
  static String productorder = "po";
  static String post = "p";
  static String spot = "s";
  static String section = "se";
  static String event = "ev";
  static String menu = "me";
  static String menuorder = "mo";
}
