// To parse this JSON data, do
//
//     final workspotsAccount = workspotsAccountFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

WorkspotsAccount workspotsAccountFromJson(String str) =>
    WorkspotsAccount.fromJson(json.decode(str));

String workspotsAccountToJson(WorkspotsAccount? data) =>
    json.encode(data!.toJson());

List<WorkspotsAccount?> workspotsAccountFromJsonList(String str) =>
    json.decode(str) == null
        ? []
        : List<WorkspotsAccount?>.from(
            json.decode(str)!.map((x) => WorkspotsAccount.fromJson(x)));

String workspotsAccountToJsonList(List<WorkspotsAccount?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class WorkspotsAccount {
  WorkspotsAccount({
    this.id,
    this.name,
    this.phonenumber,
    this.email,
    this.isuser,
    this.imageurl,
    this.requests,
    this.follows,
    this.interests,
  });

  int? id;
  String? name;
  String? phonenumber;
  String? email;
  String? isuser;
  String? imageurl;
  List<String?>? requests;
  List<String?>? follows;
  List<Interest>? interests;

  factory WorkspotsAccount.fromJson(Map<String, dynamic> json) =>
      WorkspotsAccount(
        id: json["id"],
        name: json["name"],
        phonenumber: json["phonenumber"],
        email: json["email"],
        isuser: json["isuser"],
        imageurl: json["imageurl"],
        requests: json["requests"] == null
            ? []
            : json["requests"] == null
                ? []
                : List<String>.from(json["requests"] is List<dynamic>
                    ? jsonDecode(jsonEncode(json["requests"])).map((x) => x)
                    : jsonDecode(json["requests"]).map((x) => x)),
        follows: json["follows"] == null
            ? []
            : json["follows"] == null
                ? []
                : List<String>.from(json["follows"] is List<dynamic>
                    ? jsonDecode(jsonEncode(json["follows"])).map((x) => x)
                    : jsonDecode(json["follows"]).map((x) => x)),
        interests: json["interests"] == null
            ? []
            : List<Interest>.from(json["interests"] is List<dynamic>
                ? jsonDecode(jsonEncode(json["interests"]))
                    .map((x) => Interest.fromJson(x))
                : jsonDecode(json["interests"])
                    .map((x) => Interest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phonenumber": phonenumber,
        "email": email,
        "isuser": isuser,
        "imageurl": imageurl,
        "requests": requests == null
            ? []
            : requests == null
                ? []
                : List<dynamic>.from(requests!.map((x) => x)),
        "follows": follows == null
            ? []
            : follows == null
                ? []
                : List<dynamic>.from(follows!.map((x) => x)),
        "interests": interests == null
            ? []
            : interests == null
                ? []
                : List<dynamic>.from(interests!.map((x) => x.toJson())),
      };
}

List<Interest> interestFromJsonList(String str) => json.decode(str) == null
    ? []
    : List<Interest>.from(json.decode(str)!.map((x) => Interest.fromJson(x)));

String interestToJsonList(List<Interest>? data) => data == null
    ? '[]'
    : json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Interest? interestFromJson(String str) => Interest.fromJson(json.decode(str));

String interestToJson(Interest? data) => json.encode(data!.toJson());

class Interest {
  Interest({
    this.n,
    this.r,
    this.l,
  });

  String? n;
  int? r;
  String? l;

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        n: json["n"],
        r: json["r"],
        l: json["l"],
      );

  Map<String, dynamic> toJson() => {
        "n": n,
        "r": r,
        "l": l,
      };
}
