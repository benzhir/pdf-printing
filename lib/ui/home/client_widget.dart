import 'package:diagnostic_app/main.dart';
import 'package:diagnostic_app/ui/pdf.dart';
import 'package:diagnostic_app/ui/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:diagnostic_app/constants.dart' as Constants;

import 'package:diagnostic_app/model/User.dart';

class ClientWidget extends StatelessWidget {
  final User client;
  const ClientWidget({
    Key key,
    @required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                displayCircleImage(client.profilePictureURL, 50, false),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          client.fullName().toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        client.car?.maque != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.directions_car,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    client.car.maque,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                text: 'Adresse: ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: ' ${client.address}',
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                text: 'Tél. Portable: ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: ' ${client.phoneNumber}',
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                text: 'Mail: ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: ' ${client.email}',
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {
                  MyAppState.client = client;
                  push(context, PdfPage());
                },
                child: new Text(
                  'Document PDF',
                  style: TextStyle(
                    color: Color(Constants.COLOR_PRIMARY),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
