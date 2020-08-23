import 'dart:convert';

class Car {
  String maque;
  String modele;
  String version;
  String serie;
  String immatriculation;
  String dateMiseEnCirculation;
  String antivol;
  String codeMoteur;
  Car({
    this.maque,
    this.modele,
    this.version,
    this.serie,
    this.immatriculation,
    this.dateMiseEnCirculation,
    this.antivol,
    this.codeMoteur,
  });

  Car copyWith({
    String maque,
    String modele,
    String version,
    String serie,
    String immatriculation,
    String dateMiseEnCirculation,
    String antivol,
    String codeMoteur,
  }) {
    return Car(
      maque: maque ?? this.maque,
      modele: modele ?? this.modele,
      version: version ?? this.version,
      serie: serie ?? this.serie,
      immatriculation: immatriculation ?? this.immatriculation,
      dateMiseEnCirculation: dateMiseEnCirculation ?? this.dateMiseEnCirculation,
      antivol: antivol ?? this.antivol,
      codeMoteur: codeMoteur ?? this.codeMoteur,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maque': maque,
      'modele': modele,
      'version': version,
      'serie': serie,
      'immatriculation': immatriculation,
      'dateMiseEnCirculation': dateMiseEnCirculation,
      'antivol': antivol,
      'codeMoteur': codeMoteur,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Car(
      maque: map['maque'],
      modele: map['modele'],
      version: map['version'],
      serie: map['serie'],
      immatriculation: map['immatriculation'],
      dateMiseEnCirculation: map['dateMiseEnCirculation'],
      antivol: map['antivol'],
      codeMoteur: map['codeMoteur'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Car(maque: $maque, modele: $modele, version: $version, serie: $serie, immatriculation: $immatriculation, dateMiseEnCirculation: $dateMiseEnCirculation, antivol: $antivol, codeMoteur: $codeMoteur)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Car &&
      o.maque == maque &&
      o.modele == modele &&
      o.version == version &&
      o.serie == serie &&
      o.immatriculation == immatriculation &&
      o.dateMiseEnCirculation == dateMiseEnCirculation &&
      o.antivol == antivol &&
      o.codeMoteur == codeMoteur;
  }

  @override
  int get hashCode {
    return maque.hashCode ^
      modele.hashCode ^
      version.hashCode ^
      serie.hashCode ^
      immatriculation.hashCode ^
      dateMiseEnCirculation.hashCode ^
      antivol.hashCode ^
      codeMoteur.hashCode;
  }
}
