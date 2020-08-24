import 'package:diagnostic_app/model/Prestation.dart';
import 'package:diagnostic_app/ui/pdf.dart';
import 'package:diagnostic_app/ui/services/Authenticate.dart';
import 'package:diagnostic_app/ui/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:uuid/uuid.dart';
import '../../constants.dart' as Constants;
import '../../main.dart';

class PrestationForm extends StatefulWidget {
  PrestationForm({Key key}) : super(key: key);

  @override
  _PrestationFormState createState() => _PrestationFormState();
}

class _PrestationFormState extends State<PrestationForm> {
  List<String> _list = [
    Constants.vMoteur,
    Constants.vboite,
    Constants.vPoint,
    Constants.fAir,
    Constants.fHuile,
    Constants.fCarburant,
    Constants.fHabitacle,
    Constants.lFrien,
    Constants.lRefroidisement,
    Constants.eRoues,
    Constants.pneus,
    Constants.climatisation,
    Constants.reporogrammation,
    Constants.diagnostic,
    Constants.balais,
    Constants.eclairage,
    Constants.obd,
    Constants.bougies
  ];
  List<String> _checkedList = [];

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
            child: CheckboxGroup(
                labels: _list,
                onSelected: (List<String> checked) {
                  _checkedList = checked;
                  setState(() {});
                })),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _sendToServer(),
        label: Text(
          "Suivant",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  _sendToServer() async {
    showProgress(context, 'Loading...', false);
    try {
      Prestation prestation = new Prestation(
        vMoteur: _checkedList.contains(Constants.vMoteur),
        vboite: _checkedList.contains(Constants.vboite),
        vPoint: _checkedList.contains(Constants.vPoint),
        fAir: _checkedList.contains(Constants.fAir),
        fHuile: _checkedList.contains(Constants.fHuile),
        fCarburant: _checkedList.contains(Constants.fCarburant),
        fHabitacle: _checkedList.contains(Constants.fHabitacle),
        lFrien: _checkedList.contains(Constants.lFrien),
        lRefroidisement: _checkedList.contains(Constants.lRefroidisement),
        eRoues: _checkedList.contains(Constants.eRoues),
        climatisation: _checkedList.contains(Constants.climatisation),
        reporogrammation: _checkedList.contains(Constants.reporogrammation),
        diagnostic: _checkedList.contains(Constants.diagnostic),
        pneus: _checkedList.contains(Constants.pneus),
        eclairage: _checkedList.contains(Constants.eclairage),
        balais: _checkedList.contains(Constants.balais),
        obd: _checkedList.contains(Constants.obd),
        bougies: _checkedList.contains(Constants.bougies),
      );
      MyAppState.client.prestation = prestation;

      await FireStoreUtils.firestore
          .collection(Constants.USERS)
          .document(Uuid().v1())
          .setData(MyAppState.client.toJson());
      hideProgress();
      pushReplacement(context, PdfPage());
    } catch (error) {
      hideProgress();
      (error as PlatformException).code != 'ERROR_EMAIL_ALREADY_IN_USE'
          ? showAlertDialog(context, 'Failed', 'Couldn\'t sign up')
          : showAlertDialog(context, 'Failed',
              'Email already in use. Please pick another Mail');
      print(error.toString());
    }
  }
}
