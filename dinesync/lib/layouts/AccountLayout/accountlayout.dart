import 'package:dinesync/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:workspots/Database/LocalDB/localdb.dart';

import 'components/body.dart';

class AccountLayout extends StatelessWidget {
  const AccountLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/workspotlogo.png"),
        title: Text(
          WorkControll.instance.user.value.name ?? "Profile",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
