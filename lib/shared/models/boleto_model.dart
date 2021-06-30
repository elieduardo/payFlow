import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? dueDate;
  late String? value;
  final String? barcode;
  late bool? isPayed;

  BoletoModel({
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
    this.isPayed = false,
  });

  BoletoModel copyWith({
    String? name,
    String? dueDate,
    String? value,
    String? barcode,
    bool? isPayed,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
      isPayed: isPayed ?? this.isPayed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
      'isPayed': isPayed,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
      isPayed: map['isPayed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) =>
      BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode, isPayed: $isPayed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoletoModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode &&
        other.isPayed == isPayed;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dueDate.hashCode ^
        value.hashCode ^
        barcode.hashCode ^
        isPayed.hashCode;
  }
}
