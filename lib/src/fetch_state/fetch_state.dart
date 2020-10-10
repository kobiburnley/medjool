class FetchState {
  static FetchState fromIterable<T>(Iterable<T> iterable) {
    return iterable.isEmpty ? FetchState.noData : FetchState.resolved;
  }

  static FetchState loading = FetchState('loading');
  static FetchState resolving = FetchState('resolving');
  static FetchState resolved = FetchState('resolved');
  static FetchState error = FetchState('error');
  static FetchState noData = FetchState('noData');

  String id;

  FetchState(this.id);

  bool get isLoading => this == loading;

  bool get isNoData => this == noData;

  bool get isError => this == error;
}
