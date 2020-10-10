// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_result.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QueryResult<T> on QueryResultBase<T>, Store {
  final _$recordsAtom = Atom(name: 'QueryResultBase.records');

  @override
  List<T> get records {
    _$recordsAtom.reportRead();
    return super.records;
  }

  @override
  set records(List<T> value) {
    _$recordsAtom.reportWrite(value, super.records, () {
      super.records = value;
    });
  }

  final _$totalAtom = Atom(name: 'QueryResultBase.total');

  @override
  int get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  @override
  String toString() {
    return '''
records: ${records},
total: ${total}
    ''';
  }
}
