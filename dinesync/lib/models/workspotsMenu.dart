// To parse this JSON data, do
//
//     final workspotsMenu = workspotsMenuFromJson(jsonString);

import 'dart:convert';

WorkspotsMenu workspotsMenuFromJson(String str) =>
    WorkspotsMenu.fromJson(json.decode(str));

String workspotsMenuToJson(WorkspotsMenu data) => json.encode(data.toJson());

List<WorkspotsMenu> workspotsMenuFromJsonList(String str) =>
    List<WorkspotsMenu>.from(
        json.decode(str).map((x) => WorkspotsMenu.fromJson(x)));

String workspotsMenuToJsonList(List<WorkspotsMenu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkspotsMenu {
  int? id;
  String? uid;
  String? spotid;
  bool? isorder;
  String? desid;
  String? name;
  String? img;
  String? backimg;
  List<String>? menutables;
  List<Menusection>? menusections;
  String? createdAt;
  String? updatedAt;

  WorkspotsMenu({
    this.id,
    this.uid,
    this.spotid,
    this.isorder,
    this.desid,
    this.name,
    this.img,
    this.backimg,
    this.menutables,
    this.menusections,
    this.createdAt,
    this.updatedAt,
  });

  WorkspotsMenu copyWith(WorkspotsMenu thiss) => WorkspotsMenu(
        id: thiss.id,
        uid: thiss.uid,
        spotid: thiss.spotid,
        isorder: thiss.isorder,
        desid: thiss.desid,
        name: thiss.name,
        img: thiss.img,
        backimg: thiss.backimg,
        menutables: thiss.menutables,
        menusections: thiss.menusections,
        createdAt: thiss.createdAt,
        updatedAt: thiss.updatedAt,
      );

  factory WorkspotsMenu.fromJson(Map<String, dynamic> json) => WorkspotsMenu(
        id: json["id"],
        uid: json["uid"],
        spotid: json["spotid"],
        isorder: json["isorder"] == null
            ? false
            : json["isorder"] == "s"
                ? true
                : false,
        desid: json["desid"],
        name: json["name"],
        img: json["img"],
        backimg: json["backimg"],
        menutables: json["menutables"] == null
            ? []
            : List<String>.from(json["menutables"] is List<dynamic>
                ? jsonDecode(jsonEncode(json["menutables"])).map((x) => x)
                : jsonDecode(json["menutables"]).map((x) => x)),
        menusections: json["menusections"] == null
            ? []
            : List<Menusection>.from(json["menusections"] is List<dynamic>
                ? jsonDecode(jsonEncode(json["menusections"]))
                    .map((x) => Menusection.fromJson(x))
                : jsonDecode(json["menusections"])
                    .map((x) => Menusection.fromJson(x))),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "spotid": spotid,
        "isorder": isorder == null
            ? "f"
            : isorder == true
                ? "s"
                : "f",
        "desid": desid,
        "name": name,
        "img": img,
        "backimg": backimg,
        "menutables": menutables == null
            ? []
            : List<dynamic>.from(menutables!.map((x) => x)),
        "menusections": menusections == null
            ? []
            : List<dynamic>.from(menusections!.map((x) => x.toJson())),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

Menusection menuSectionFromJson(String str) =>
    Menusection.fromJson(json.decode(str));

String menuSectionToJson(Menusection data) => json.encode(data.toJson());

List<Menusection> menuSectionFromJsonList(String str) => List<Menusection>.from(
    json.decode(str).map((x) => Menusection.fromJson(x)));

String menuSectionToJsonList(List<Menusection> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menusection {
  String? name;
  List<Menu>? menus;

  Menusection({
    this.name,
    this.menus,
  });

  Menusection copyWith({
    String? name,
    List<Menu>? menus,
  }) =>
      Menusection(
        name: name ?? this.name,
        menus: menus ?? this.menus,
      );

  factory Menusection.fromJson(Map<String, dynamic> json) => Menusection(
        name: json["name"],
        menus: json["menus"] == null
            ? []
            : List<Menu>.from(json["menus"] is List<dynamic>
                ? jsonDecode(jsonEncode(json["menus"]))
                    .map((x) => Menu.fromJson(x))
                : jsonDecode(json["menus"]).map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "menus": menus == null
            ? []
            : List<dynamic>.from(menus!.map((x) => x.toJson())),
      };
}

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

List<Menu> menuFromJsonList(String str) =>
    List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJsonList(List<Menu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
  String? i;
  String? n;
  String? s;
  String? p;
  String? m;
  bool? h;

  Menu({
    this.i,
    this.n,
    this.s,
    this.p,
    this.m,
    this.h,
  });

  // Menu copyWith({
  //   String? i,
  //   String? n,
  //   String? s,
  //   String? p,
  //   bool? h,
  // }) =>
  //     Menu(
  //       i: i ?? this.i,
  //       n: n ?? this.n,
  //       s: s ?? this.s,
  //       p: p ?? this.p,
  //       h: h ?? this.h,
  //     );

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        i: json["i"],
        n: json["n"],
        s: json["s"],
        p: json["p"],
        m: json["m"],
        h: json["h"] == null
            ? false
            : json["h"] == "s"
                ? true
                : false,
      );

  Map<String, dynamic> toJson() => {
        "i": i,
        "n": n,
        "s": s,
        "p": p,
        "m": m,
        "h": h == null
            ? false
            : h == true
                ? "s"
                : "f",
      };
}
