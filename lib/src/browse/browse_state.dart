import '../fetch_state/fetch_state.dart';
import '../query_result/query_result.dart';

class BrowseState<T> {
  FetchState fetchState = FetchState.noData;
  QueryResult<T> queryResult = QueryResult();
  Map<String, String> filters;

  BrowseState(
      {FetchState fetchState,
      QueryResult<T> queryResult,
      Map<String, String> filters})
      : fetchState = fetchState ?? FetchState.noData,
        queryResult = queryResult ?? QueryResult(),
        filters = filters ?? {};

  BrowseState<T> reset() {
    return this..queryResult.clear();
  }
}
