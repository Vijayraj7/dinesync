import 'dart:convert';
import 'dart:io';

import 'package:dinesync/Models/workspotsMenu.dart';
import 'package:dinesync/layouts/AccountLayout/AccountPage/qrscanner.dart';
import 'package:dinesync/layouts/Menulayout/MenuOrders/menuorderlist.dart';
import 'package:dinesync/layouts/Menulayout/QrCard/qrcard.dart';
import 'package:dinesync/layouts/Menulayout/addmenu.dart';
import 'package:dinesync/layouts/Menulayout/menulayout.dart';
import 'package:dinesync/models/workspotsMenuOrder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_restart/flutter_app_restart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:dinesync/Database/Fire/fireDB.dart';
// import 'package:dinesync/Database/LocalDB/localdb.dart';
import 'package:dinesync/Database/dataposting.dart';
// import 'package:dinesync/Database/encapp.dart';
// import 'package:dinesync/Layouts/ContactPage/contactpage.dart';
// import 'package:dinesync/Layouts/EditPage/editnamepage.dart';
// import 'package:dinesync/Layouts/FollowingLayout/followinglayout.dart';
// import 'package:dinesync/Layouts/NotificationsLayout/notificationslayout.dart';
// import 'package:dinesync/Layouts/OrderPage/orderpage.dart';
// import 'package:dinesync/Layouts/PhoneSignPage/phonesignpage.dart';
// import 'package:dinesync/Models/dinesyncSpots.dart';
// import 'package:dinesync/Models/dinesyncaccount.dart';
import 'package:dinesync/Theme/appbar.dart';
import 'package:dinesync/Theme/btsheet.dart';
import 'package:dinesync/Theme/fonts.dart';
import 'package:dinesync/main.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:image_picker/image_picker.dart';

import '../components/profile_pic.dart';
import '../components/profile_menu.dart';

class AccountBody extends StatefulWidget {
  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    printer(WorkControll.instance.user.value.phonenumber);
    return Scaffold(
      appBar: appBar(title: WorkControll.instance.user.value.name ?? "Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                // final ImagePicker _picker = ImagePicker();
                // // Pick an image
                // final XFile? image =
                //     await _picker.pickImage(source: ImageSource.gallery);
                // if (image != null) {
                //   var d = await postFile(File(image.path),
                //       LocalDB.instance.user.value.id.toString());
                //   await FireDB.accountinstance
                //       .column('imageurl')
                //       .row('id', LocalDB.instance.user.value.id.toString())
                //       .setstring(d);
                //   LocalDB.instance.user.value = dinesyncAccountFromJson(
                //       await FireDB.accountinstance.getoneby({
                //     'phonenumber':
                //         FirebaseAuth.instance.currentUser!.phoneNumber
                //   }));
                //   setState(() {});
                // }
              },
              child: const ProfilePic(),
            ),
            const SizedBox(height: 10),
            Center(
                child: Text(
              WorkControll.instance.user.value.name ?? "",
              style: Fonts.normal(
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
            )),
            Center(
                child: Text(
              WorkControll.instance.user.value.phonenumber ?? "",
              style: Fonts.normal(
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
            )),
            const SizedBox(height: 20),
            // ProfileMenu(
            //   text: "My Account",
            //   // icon: "assets/icons/Settings.svg",
            //   icon: Icons.person,
            //   press: () {},
            // ),
            // if (WorkControll.instance.user.value.isuser == "s")
            ProfileMenu(
              text: "Add Menu",
              // icon: "assets/icons/Question mark.svg",
              icon: Icons.add,
              press: () {
                WorkspotsMenu men = WorkspotsMenu(
                    spotid: WorkControll.instance.user.value.id.toString(),
                    menusections: [],
                    menutables: []);

                Get.to(AddMenu(menu: men));

                // Get.to(EditNamePage(wspots: LocalDB.instance.user.value));
              },
            ),
            ProfileMenu(
              text: "Qr Menu",
              // icon: "assets/icons/Question mark.svg",
              icon: Icons.qr_code,
              press: () async {
                WorkspotsMenu men = WorkspotsMenu(
                    spotid: WorkControll.instance.user.value.id.toString(),
                    menusections: [],
                    menutables: []);

                Get.to(MenuQrCard(menu: men));

                // Get.to(EditNamePage(wspots: LocalDB.instance.user.value));
              },
            ),

            ProfileMenu(
              text: "Scan",
              // icon: "assets/icons/Question mark.svg",
              icon: Icons.qr_code_scanner_sharp,
              press: () async {
                WorkspotsMenu men = workspotsMenuFromJson(
                    await FireDB.menuinstance.getoneby({
                  'spotid': WorkControll.instance.user.value.id.toString()
                }));

                Get.to(QrScannerPage(onload: (s) {
                  toqr(s);
                }));

                // Get.to(EditNamePage(wspots: LocalDB.instance.user.value));
              },
            ),
            ProfileMenu(
              text: "MenuOrderList",
              // icon: "assets/icons/Question mark.svg",
              icon: Icons.menu,
              press: () async {
                // WorkspotsMenu men = WorkspotsMenu(
                //     spotid: WorkControll.instance.user.value.id.toString(),
                //     menusections: [],
                //     menutables: []);
                WorkspotsMenuOrder mn = workspotsMenuOrderFromJson(
                    await FireDB.menuOrderinstance.getallby({
                  'spotid': WorkControll.instance.user.value.id.toString()
                }));
                Get.to(MenuOrderList(qrorder: mn));

                // Get.to(EditNamePage(wspots: LocalDB.instance.user.value));
              },
            ),
            // ProfileMenu(
            //   text: "Change phone number",
            //   // icon: "assets/icons/Settings.svg",
            //   icon: Icons.edit,
            //   press: () {
            //     Get.to(PhoneSignInPage());
            //   },
            // ),
            // ProfileMenu(
            //   text: "Following",
            //   // icon: "assets/icons/Settings.svg",
            //   icon: Icons.account_circle,
            //   press: () async {
            //     // var spots = dinesyncSpotsFromJsonList(await FireDB.spotinstance
            //     //     .getallbylike({
            //     //   'followers': LocalDB.instance.user.value.id.toString()
            //     // }));
            //     // printer("json.encode(spots)");
            //     // printer(json.encode(spots));
            //     // printer("json.encode(spots");
            //     // Get.to(FollowingLayout(spots: spots));
            //   },
            // ),
            ProfileMenu(
              text: "Log Out",
              // icon: "assets/icons/Log out.svg",
              icon: Icons.logout,
              press: () async {
                // await FirebaseAuth.instance.signOut();
                logout();
                // await GoogleSignIn().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

logout() async {
  // FlutterRestart.restartApp();
  // if (FirebaseAuth.instance.currentUser != null) {
  //   await FirebaseAuth.instance.signOut();
  // }
  // clearsub();
  // GetStorage().remove(LoginKEy.phone);
  // WorkControll.instance.isinited.value = false;
  GetStorage().remove('login');
  GetStorage().remove('us');
  GetStorage().remove('ps');
  Get.offAll(MainApp());
  // FlutterRestart.restartApp();
  // await Get.offAll(MainApp());
  // FlutterRestart.restartApp();
}

logoutotp() async {
  // GetStorage().remove(LoginKEy.phone);
  // clearsub();
  WorkControll.instance.isinited.value = false;
  // FlutterRestart.restartApp();
  await Get.offAll(MainApp());
  // FlutterRestart.restartApp();
}
