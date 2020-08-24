import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diagnostic_app/ui/form/client_form.dart';
import 'package:diagnostic_app/ui/home/client_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnostic_app/constants.dart';
import 'package:diagnostic_app/model/User.dart';
import 'package:diagnostic_app/ui/auth/AuthScreen.dart';
import 'package:diagnostic_app/ui/services/Authenticate.dart';
import 'package:diagnostic_app/ui/utils/helper.dart';

import '../../main.dart';

FireStoreUtils _fireStoreUtils = FireStoreUtils();

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  State createState() {
    print(user.toString());
    return _HomeState(user);
  }
}

class _HomeState extends State<HomeScreen> {
  final User user;

  _HomeState(this.user);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: displayCircleImage(user.profilePictureURL, 100, false),
        title: Text(
          user.fullName().toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                MyAppState.currentUser = null;
                pushAndRemoveUntil(context, AuthScreen(), false);
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FireStoreUtils.firestore
                      .collection('users')
                      .where("isAdmin", isEqualTo: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    // count of events
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        List<User> clients = snapshot.data.documents
                            .map((e) => User.fromJson(e.data))
                            .toList();
                        return new ListView.builder(
                            itemCount: clients.length,
                            itemBuilder: (context, index) {
                              return new ClientWidget(client: clients[index]);
                            });
                    }
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => push(context, new ClientForm()),
        child: Icon(Icons.add),
      ),
    );
  }
}
