import 'package:flutter/material.dart';

Widget opener({required Widget appbar, required List<Widget> children}) {
  return NestedScrollView(
    floatHeaderSlivers: true,
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[appbar];
    },
    body: Container(child: SingleChildScrollView(child: Column(children: []))),
  );
}

Widget openerp({required Widget appbar, required Widget page}) {
  return NestedScrollView(
    floatHeaderSlivers: true,
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[appbar];
    },
    body: Container(child: page),
  );
}
