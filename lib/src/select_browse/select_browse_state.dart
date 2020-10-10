import 'package:mobx/mobx.dart';

import '../browse/browse_state.dart';
import '../select/select_state.dart';

class SelectBrowseState<T> {
  final BrowseState<T> browse;
  final SelectState<T> select;

  SelectBrowseState({BrowseState<T> browse, SelectState<T> select})
      : browse = browse ?? BrowseState(),
        select = select ?? SelectState();

  Computed<int> _indexOfSelected;

  int get indexOfSelected {
    if (_indexOfSelected == null) {
      _indexOfSelected = Computed(() {
        final selected = select.selected.values;
        return selected.isNotEmpty
            ? browse.queryResult.records.indexOf(selected.first)
            : -1;
      });
    }
    return _indexOfSelected.value;
  }

  T get first => select.selected.values.firstWhere(
        (e) => true,
        orElse: () => null,
      );
}
