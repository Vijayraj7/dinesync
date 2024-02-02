// To parse this JSON data, do
//
//     final workspotsMenuOrder = workspotsMenuOrderFromJson(jsonString);

import 'dart:convert';

import 'package:dinesync/Models/workspotsMenu.dart';

List<WorkspotsMenuOrder> workspotsMenuOrderFromJsonList(String str) =>
    List<WorkspotsMenuOrder>.from(
        json.decode(str).map((x) => WorkspotsMenuOrder.fromJson(x)));
String workspotsMenuOrderToJsonList(List<WorkspotsMenuOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

WorkspotsMenuOrder workspotsMenuOrderFromJson(String str) =>
    WorkspotsMenuOrder.fromJson(json.decode(str));
String workspotsMenuOrderToJson(WorkspotsMenuOrder data) =>
    json.encode(data.toJson());

class WorkspotsMenuOrder {
  int? id;
  String? uid;
  String? tid;
  String? mid;
  String? spotid;
  String? accid;
  String? acemail;
  String? val;
  WorkspotsMenu menu;
  String? createdAt;
  String? updatedAt;

  WorkspotsMenuOrder({
    this.id,
    this.uid,
    this.tid,
    this.mid,
    this.spotid,
    this.accid,
    this.acemail,
    this.val,
    required this.menu,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkspotsMenuOrder.fromJson(Map<String, dynamic> json) =>
      WorkspotsMenuOrder(
        id: json["id"],
        uid: json["uid"],
        tid: json["tid"],
        mid: json["mid"],
        spotid: json["spotid"],
        accid: json["accid"],
        acemail: json["acemail"],
        val: json["val"],
        menu: workspotsMenuFromJson(json["menu"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "tid": tid,
        "mid": mid,
        "spotid": spotid,
        "accid": accid,
        "acemail": acemail,
        "val": val,
        "menu": workspotsMenuToJson(menu),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
