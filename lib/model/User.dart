import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diagnostic_app/model/Car.dart';
import 'package:diagnostic_app/model/Prestation.dart';

class User {
  String email = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  bool isAdmin = false;
  Timestamp lastOnlineTimestamp = Timestamp.now();
  String userID;
  String profilePictureURL = '';
  String address;
  Car car;
  Prestation prestation;

  User(
      {this.email,
      this.firstName,
      this.phoneNumber,
      this.lastName,
      this.isAdmin,
      this.lastOnlineTimestamp,
      this.userID,
      this.profilePictureURL,
      this.address,
      this.car,
      this.prestation});

  String fullName() {
    return '$firstName $lastName';
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    var clientCar = parsedJson["car"] != null
        ? Map<String, dynamic>.from(parsedJson["car"])
        : null;
    var clientPrestation = parsedJson["prestation"] != null
        ? Map<String, dynamic>.from(parsedJson["prestation"])
        : null;
    print(parsedJson["car"]);
    return new User(
      email: parsedJson['email'] ?? "",
      firstName: parsedJson['firstName'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
      isAdmin: parsedJson['admin'] ?? false,
      lastOnlineTimestamp: parsedJson['lastOnlineTimestamp'],
      phoneNumber: parsedJson['phoneNumber'] ?? "",
      userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
      profilePictureURL: parsedJson['profilePictureURL'] ?? "",
      address: parsedJson['address'] ?? "",
      car: clientCar != null ? Car.fromMap(clientCar) : null,
      prestation: clientPrestation != null
          ? Prestation.fromMap(clientPrestation)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "firstName": this.firstName,
      "lastName": this.lastName,
      "phoneNumber": this.phoneNumber,
      "id": this.userID,
      'isAdmin': this.isAdmin,
      'lastOnlineTimestamp': this.lastOnlineTimestamp,
      "profilePictureURL": this.profilePictureURL,
      'address': this.address,
      'car': car?.toMap(),
      'prestation': prestation?.toMap(),
    };
  }
}
