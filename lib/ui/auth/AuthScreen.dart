import 'package:flutter/material.dart';
import 'package:diagnostic_app/ui/utils/helper.dart';

import '../../constants.dart' as Constants;
import '../login/LoginScreen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0, bottom: 20.0),
                child: Icon(
                  Icons.directions_car,
                  size: 150,
                  color: Color(Constants.COLOR_PRIMARY),
                ),
              ),
            ),
            Text(
              'AZ PERFORMANCES',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(Constants.COLOR_PRIMARY),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Créateur de sensations'.toUpperCase(),
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  color: Color(Constants.COLOR_PRIMARY),
                  child: Text(
                    'S\'identifier',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  splashColor: Color(Constants.COLOR_PRIMARY),
                  onPressed: () {
                    push(context, new LoginScreen());
                  },
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Color(Constants.COLOR_PRIMARY))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
