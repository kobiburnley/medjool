import 'package:mobx/mobx.dart';

part 'select_state.g.dart';

class SelectState<T> extends SelectStateBase<T>
    with _$SelectState<T>, _$SelectStateExtensions<T> {
  SelectState({Map<String, T> selected}) : super(selected: selected);
}

abstract class SelectStateBase<T> with Store {
  @observable
  Map<String, T> selected;

  SelectStateBase({Map<String, T> selected}) : selected = selected ?? {};
}

mixin _$SelectStateExtensions<T> on _$SelectState<T> {
  T remove(Object key) {
    final t = super.selected.remove(key);
    _$selectedAtom.reportChanged();
    return t;
  }

  void operator []=(String key, T value) {
    super.selected[key] = value;
    _$selectedAtom.reportChanged();
  }
}
