import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../fetch_state/fetch_state.dart';
import '../query_result/query_result.dart';
import 'browse_state.dart';

class BrowseActions<T> {
  final BrowseState<T> state;

  final Future<QueryResult<T>> Function() fetchData;

  BrowseActions({@required this.state, @required this.fetchData});

  Future<void> refresh() async {
    await runInAction(() async {
      state.reset();
      await load();
    });
  }

  void search(String term) {
    state.filters['search'] = term;
    refresh();
  }

  Future<void> load() async {
    runInAction(() {
      state.fetchState = FetchState.loading;
    });
    try {
      final result = await fetchData();
      runInAction(() {
        state.queryResult.addPageResult(result);
        state.fetchState = FetchState.fromIterable(result.records);
      });
    } catch (e, s) {
      print(e);
      print(s);
      runInAction(() {
        state.fetchState = FetchState.error;
      });
    }
  }

  void reorder(int oldIndex, int newIndex) {
    runInAction(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final newList = <T>[];
      newList.addAll(state.queryResult.records);
      final item = newList.removeAt(oldIndex);
      newList.insert(newIndex, item);
      state.queryResult.records = newList;
    });
  }
}
