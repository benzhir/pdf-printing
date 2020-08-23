import 'dart:convert';

class Prestation {
  bool vMoteur;
  bool vboite;
  bool vPoint;
  bool fAir;
  bool fHuile;
  bool fCarburant;
  bool fHabitacle;
  bool lFrien;
  bool lRefroidisement;
  bool eRoues;
  bool pneus;
  bool climatisation;
  bool reporogrammation;
  bool diagnostic;
  bool balais;
  bool eclairage;
  bool obd;
  bool bougies;
  Prestation({
    this.vMoteur,
    this.vboite,
    this.vPoint,
    this.fAir,
    this.fHuile,
    this.fCarburant,
    this.fHabitacle,
    this.lFrien,
    this.lRefroidisement,
    this.eRoues,
    this.pneus,
    this.climatisation,
    this.reporogrammation,
    this.diagnostic,
    this.balais,
    this.eclairage,
    this.obd,
    this.bougies,
  });

  Prestation copyWith({
    bool vMoteur,
    bool vboite,
    bool vPoint,
    bool fAir,
    bool fHuile,
    bool fCarburant,
    bool fHabitacle,
    bool lFrien,
    bool lRefroidisement,
    bool eRoues,
    bool pneus,
    bool climatisation,
    bool reporogrammation,
    bool diagnostic,
    bool balais,
    bool eclairage,
    bool obd,
    bool bougies,
  }) {
    return Prestation(
      vMoteur: vMoteur ?? this.vMoteur,
      vboite: vboite ?? this.vboite,
      vPoint: vPoint ?? this.vPoint,
      fAir: fAir ?? this.fAir,
      fHuile: fHuile ?? this.fHuile,
      fCarburant: fCarburant ?? this.fCarburant,
      fHabitacle: fHabitacle ?? this.fHabitacle,
      lFrien: lFrien ?? this.lFrien,
      lRefroidisement: lRefroidisement ?? this.lRefroidisement,
      eRoues: eRoues ?? this.eRoues,
      pneus: pneus ?? this.pneus,
      climatisation: climatisation ?? this.climatisation,
      reporogrammation: reporogrammation ?? this.reporogrammation,
      diagnostic: diagnostic ?? this.diagnostic,
      balais: balais ?? this.balais,
      eclairage: eclairage ?? this.eclairage,
      obd: obd ?? this.obd,
      bougies: bougies ?? this.bougies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vMoteur': vMoteur,
      'vboite': vboite,
      'vPoint': vPoint,
      'fAir': fAir,
      'fHuile': fHuile,
      'fCarburant': fCarburant,
      'fHabitacle': fHabitacle,
      'lFrien': lFrien,
      'lRefroidisement': lRefroidisement,
      'eRoues': eRoues,
      'pneus': pneus,
      'climatisation': climatisation,
      'reporogrammation': reporogrammation,
      'diagnostic': diagnostic,
      'balais': balais,
      'eclairage': eclairage,
      'obd': obd,
      'bougies': bougies,
    };
  }

  factory Prestation.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Prestation(
      vMoteur: map['vMoteur'],
      vboite: map['vboite'],
      vPoint: map['vPoint'],
      fAir: map['fAir'],
      fHuile: map['fHuile'],
      fCarburant: map['fCarburant'],
      fHabitacle: map['fHabitacle'],
      lFrien: map['lFrien'],
      lRefroidisement: map['lRefroidisement'],
      eRoues: map['eRoues'],
      pneus: map['pneus'],
      climatisation: map['climatisation'],
      reporogrammation: map['reporogrammation'],
      diagnostic: map['diagnostic'],
      balais: map['balais'],
      eclairage: map['eclairage'],
      obd: map['obd'],
      bougies: map['bougies'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Prestation.fromJson(String source) => Prestation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Prestation(vMoteur: $vMoteur, vboite: $vboite, vPoint: $vPoint, fAir: $fAir, fHuile: $fHuile, fCarburant: $fCarburant, fHabitacle: $fHabitacle, lFrien: $lFrien, lRefroidisement: $lRefroidisement, eRoues: $eRoues, pneus: $pneus, climatisation: $climatisation, reporogrammation: $reporogrammation, diagnostic: $diagnostic, balais: $balais, eclairage: $eclairage, obd: $obd, bougies: $bougies)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Prestation &&
      o.vMoteur == vMoteur &&
      o.vboite == vboite &&
      o.vPoint == vPoint &&
      o.fAir == fAir &&
      o.fHuile == fHuile &&
      o.fCarburant == fCarburant &&
      o.fHabitacle == fHabitacle &&
      o.lFrien == lFrien &&
      o.lRefroidisement == lRefroidisement &&
      o.eRoues == eRoues &&
      o.pneus == pneus &&
      o.climatisation == climatisation &&
      o.reporogrammation == reporogrammation &&
      o.diagnostic == diagnostic &&
      o.balais == balais &&
      o.eclairage == eclairage &&
      o.obd == obd &&
      o.bougies == bougies;
  }

  @override
  int get hashCode {
    return vMoteur.hashCode ^
      vboite.hashCode ^
      vPoint.hashCode ^
      fAir.hashCode ^
      fHuile.hashCode ^
      fCarburant.hashCode ^
      fHabitacle.hashCode ^
      lFrien.hashCode ^
      lRefroidisement.hashCode ^
      eRoues.hashCode ^
      pneus.hashCode ^
      climatisation.hashCode ^
      reporogrammation.hashCode ^
      diagnostic.hashCode ^
      balais.hashCode ^
      eclairage.hashCode ^
      obd.hashCode ^
      bougies.hashCode;
  }
}
