import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import 'select_state.dart';

class SelectActions<T> {
  final SelectState<T> state;
  final String Function(T t) idGetter;

  SelectActions({
    @required this.state,
    @required this.idGetter,
  });

  void toggle(T t) {
    runInAction(() {
      final id = idGetter(t);
      if (state.selected.containsKey(id)) {
        state.remove(id);
      } else {
        state[id] = t;
      }
    });
  }

  void remove(T t) {
    runInAction(() {
      final id = idGetter(t);
      state.remove(id);
    });
  }

  void selectOne(T t) {
    runInAction(() {
      final id = idGetter(t);
      state[id] = t;
    });
  }

  void select(Iterable<T> items) {
    runInAction(() {
      final selected = state.selected.values.toList();
      selected.addAll(items);
      state.selected =
          Map.fromIterable(selected, key: (e) => idGetter(e), value: (e) => e);
    });
  }

  void initSelected(Iterable<T> values) {
    runInAction(() {
      state.selected = Map.fromIterables(values.map(idGetter), values);
    });
  }

  void single(T value) {
    initSelected([value]);
  }

  void reorder(int oldIndex, int newIndex) {
    runInAction(() {
      final newList = <MapEntry<String, T>>[];
      for (final entry in state.selected.entries) {
        newList.add(MapEntry<String, T>(entry.key, entry.value));
      }
      final item = newList.removeAt(oldIndex);
      newList.insert(newIndex, item);
      state.selected = Map.fromEntries(newList);
    });
  }
}
