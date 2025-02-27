import 'dart:convert';

import 'package:loan_app/core/data/dtos/dtos.dart';
import 'package:loan_app/core/domain/entities/entities.dart';

class CurrencyDTO {
  CurrencyDTO({
    this.currencyid,
    required this.minloanamount,
    required this.maxloanamount,
  });

  factory CurrencyDTO.fromMap(Map<String, dynamic> map) {
    return CurrencyDTO(
      // ignore: avoid_dynamic_calls
      currencyid: (map['currencyid'] is String || map['currencyid'] == null)
          ? null
          : CurrencyIdDto.fromMap(map['currencyid']),
      minloanamount: map['minloanamount'],
      maxloanamount: map['maxloanamount'],
    );
  }

  factory CurrencyDTO.fromJson(String source) =>
      CurrencyDTO.fromMap(json.decode(source));

  final CurrencyIdDto? currencyid;
  final int minloanamount;
  final int maxloanamount;

  Currency toEntity() {
    return Currency(
      currencyId: currencyid?.toEntity(),
      minLoanAmount: minloanamount,
      maxLoanAmount: maxloanamount,
    );
  }

  CurrencyDTO copyWith({
    CurrencyIdDto? currencyid,
    int? minloanamount,
    int? maxloanamount,
  }) {
    return CurrencyDTO(
      currencyid: currencyid ?? this.currencyid,
      minloanamount: minloanamount ?? this.minloanamount,
      maxloanamount: maxloanamount ?? this.maxloanamount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currencyid': currencyid?.toMap(),
      'minloanamount': minloanamount,
      'maxloanamount': maxloanamount,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CurrencyDTO(currencyid: $currencyid, minloanamount: $minloanamount, '
      'maxloanamount: $maxloanamount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyDTO &&
        other.currencyid == currencyid &&
        other.minloanamount == minloanamount &&
        other.maxloanamount == maxloanamount;
  }

  @override
  int get hashCode =>
      currencyid.hashCode ^ minloanamount.hashCode ^ maxloanamount.hashCode;
}
