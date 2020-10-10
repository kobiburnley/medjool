import 'package:mobx/mobx.dart';

part 'query_result.g.dart';

class QueryResult<T> extends QueryResultBase<T> with _$QueryResult<T> {
  QueryResult.empty() : this(records: [], total: 0);

  QueryResult({List<T> records, int total})
      : super(records: records, total: total);

  QueryResult.copy(QueryResult<T> other)
      : this(records: other.records, total: other.total);

  QueryResult.fromList(List<T> list) : this(records: list, total: list.length);

  QueryResult<T> clear() {
    return this
      ..total = 0
      ..records = [];
  }

  QueryResult<T> addPageResult(QueryResult<T> other) {
    final newRecords = <T>[];
    newRecords.addAll(records);
    newRecords.addAll(other.records);
    return this
      ..total = total + other.total
      ..records = newRecords;
  }
}

abstract class QueryResultBase<T> with Store {
  @observable
  List<T> records;
  @observable
  int total;

  QueryResultBase({List<T> records, int total})
      : records = records ?? [],
        total = total ?? 0;
}
