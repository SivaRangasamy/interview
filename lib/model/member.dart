// To parse this JSON data, do
//
//     final members = membersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Members membersFromJson(String str) => Members.fromJson(json.decode(str));

String membersToJson(Members data) => json.encode(data.toJson());

class Members {
  Members({
    required this.errorFlag,
    required this.message,
    required this.data,
  });

  String errorFlag;
  String message;
  Data data;

  factory Members.fromJson(Map<String, dynamic> json) => Members(
    errorFlag: json["error_flag"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error_flag": errorFlag,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.contacts,
    required this.invites,
  });

  List<Contact> contacts;
  List<Invite> invites;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
    invites: List<Invite>.from(json["invites"].map((x) => Invite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
    "invites": List<dynamic>.from(invites.map((x) => x.toJson())),
  };
}

class Contact {
  Contact({
    required this.contactId,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.isactive,
    required this.role,
    required this.roleName,
  });

  String contactId;
  String email;
  String firstname;
  String lastname;
  bool isactive;
  int role;
  String roleName;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    contactId: json["contact_id"],
    email: json["email"],
    firstname: json["firstname"] == null ? "null" : json["firstname"],
    lastname: json["lastname"] == null ? "null" : json["lastname"],
    isactive: json["isactive"],
    role: json["role"],
    roleName: json["role_name"],
  );

  Map<String, dynamic> toJson() => {
    "contact_id": contactId,
    "email": email,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "isactive": isactive,
    "role": role,
    "role_name": roleName,
  };
}

class Invite {
  Invite({
    required this.inviteId,
    required this.email,
    required this.configName,
  });

  String inviteId;
  String email;
  String configName;

  factory Invite.fromJson(Map<String, dynamic> json) => Invite(
    inviteId: json["invite_id"],
    email: json["email"] == null ? "null" : json["email"],
    configName: json["config_name"],
  );

  Map<String, dynamic> toJson() => {
    "invite_id": inviteId,
    "email": email,
    "config_name": configName,
  };
}
