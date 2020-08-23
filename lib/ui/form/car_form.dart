import 'package:diagnostic_app/model/Car.dart';
import 'package:diagnostic_app/ui/form/prestation_form.dart';
import 'package:diagnostic_app/ui/utils/helper.dart';
import 'package:flutter/material.dart';
import '../../constants.dart' as Constants;
import '../../main.dart';

class CarForm extends StatefulWidget {
  @override
  _CarFormState createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String marque,
      modele,
      version,
      serie,
      immatriculation,
      dateMiseEnCirculation,
      antivol,
      codeMoteur;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: new Form(
            key: _key,
            autovalidate: _validate,
            child: formUI(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _next(),
        label: Text(
          "Suivant",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  Widget formUI() {
    return new Column(
      children: <Widget>[
        new Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Véhicule',
              style: TextStyle(
                  color: Color(Constants.COLOR_PRIMARY),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            )),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                child: TextFormField(
                    validator: validateName,
                    onSaved: (String val) {
                      marque = val;
                    },
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        fillColor: Colors.white,
                        hintText: 'Marque',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(Constants.COLOR_PRIMARY),
                                width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))))),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                child: TextFormField(
                    onSaved: (String val) {
                      modele = val;
                    },
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        fillColor: Colors.white,
                        hintText: 'Modèle',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(Constants.COLOR_PRIMARY),
                                width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))))),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                child: TextFormField(
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    onSaved: (String val) {
                      version = val;
                    },
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        fillColor: Colors.white,
                        hintText: 'Version',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(Constants.COLOR_PRIMARY),
                                width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))))),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                child: TextFormField(
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    onSaved: (String val) {
                      serie = val;
                    },
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        fillColor: Colors.white,
                        hintText: 'N° de série',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(Constants.COLOR_PRIMARY),
                                width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))))),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  onSaved: (String val) {
                    immatriculation = val;
                  },
                  style: TextStyle(height: 0.8, fontSize: 18.0),
                  cursorColor: Color(Constants.COLOR_PRIMARY),
                  decoration: InputDecoration(
                      contentPadding:
                          new EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      fillColor: Colors.white,
                      hintText: 'N° immatriculation',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                              color: Color(Constants.COLOR_PRIMARY),
                              width: 2.0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
            )),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  onSaved: (String val) {
                    dateMiseEnCirculation = val;
                  },
                  style: TextStyle(height: 0.8, fontSize: 18.0),
                  cursorColor: Color(Constants.COLOR_PRIMARY),
                  decoration: InputDecoration(
                      contentPadding:
                          new EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      fillColor: Colors.white,
                      hintText: 'Date de 1ér mise en circulation',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                              color: Color(Constants.COLOR_PRIMARY),
                              width: 2.0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
            )),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  onSaved: (String val) {
                    antivol = val;
                  },
                  style: TextStyle(height: 0.8, fontSize: 18.0),
                  cursorColor: Color(Constants.COLOR_PRIMARY),
                  decoration: InputDecoration(
                      contentPadding:
                          new EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      fillColor: Colors.white,
                      hintText: 'Antivol de roues',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                              color: Color(Constants.COLOR_PRIMARY),
                              width: 2.0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
            )),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  onSaved: (String val) {
                    codeMoteur = val;
                  },
                  style: TextStyle(height: 0.8, fontSize: 18.0),
                  cursorColor: Color(Constants.COLOR_PRIMARY),
                  decoration: InputDecoration(
                      contentPadding:
                          new EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      fillColor: Colors.white,
                      hintText: 'Code moteur',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                              color: Color(Constants.COLOR_PRIMARY),
                              width: 2.0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _next() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Car car = Car(
          maque: marque ?? '',
          modele: modele ?? '',
          version: version ?? '',
          serie: serie ?? '',
          immatriculation: immatriculation ?? '',
          dateMiseEnCirculation: dateMiseEnCirculation ?? '',
          antivol: antivol ?? '',
          codeMoteur: codeMoteur ?? '');
      MyAppState.client.car = car;
      push(context, new PrestationForm());
    } else {
      print('false');
      setState(() {
        _validate = true;
      });
    }
  }
}
