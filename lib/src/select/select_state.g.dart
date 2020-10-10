// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectState<T> on SelectStateBase<T>, Store {
  final _$selectedAtom = Atom(name: 'SelectStateBase.selected');

  @override
  Map<String, T> get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(Map<String, T> value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  @override
  String toString() {
    return '''
selected: ${selected}
    ''';
  }
}
