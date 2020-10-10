import 'dart:async';

import 'package:meta/meta.dart';

import '../browse/browse_actions.dart';
import '../query_result/query_result.dart';
import '../select/select_actions.dart';
import 'select_browse_state.dart';

class SelectBrowseActions<T> {
  SelectBrowseState<T> state;
  BrowseActions<T> browse;
  SelectActions<T> select;

  SelectBrowseActions.custom({
    @required this.state,
    @required this.browse,
    @required this.select,
  });

  factory SelectBrowseActions({
    @required SelectBrowseState<T> state,
    @required Future<QueryResult<T>> Function() fetchData,
    @required String Function(T t) idGetter,
  }) {
    final browse = BrowseActions(state: state.browse, fetchData: fetchData);

    final select = SelectActions(state: state.select, idGetter: idGetter);

    return SelectBrowseActions.custom(
      state: state,
      browse: browse,
      select: select,
    );
  }

  void selectIndex(int index) {
    final records = browse.state.queryResult.records;
    if (index >= 0 && index < records.length) {
      select.single(records.elementAt(index));
    }
  }
}
