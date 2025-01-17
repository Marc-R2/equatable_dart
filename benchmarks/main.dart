import 'package:benchmarking/benchmarking.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class EmptyEquatable extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class Empty {
  @override
  bool operator ==(Object other) => other is Empty;

  @override
  int get hashCode => 0;
}

class PrimitiveEquatable extends Equatable {
  const PrimitiveEquatable({
    required this.integer,
    required this.string,
    required this.boolean,
  });

  final int integer;
  final String string;
  final bool boolean;

  @override
  List<Object> get props => [integer, string, boolean];
}

@immutable
class Primitive {
  const Primitive({
    required this.integer,
    required this.string,
    required this.boolean,
  });

  final int integer;
  final String string;
  final bool boolean;

  @override
  bool operator ==(Object other) =>
      other is Primitive &&
      integer == other.integer &&
      string == other.string &&
      boolean == other.boolean;

  @override
  int get hashCode => Object.hash(integer, string, boolean);
}

class CollectionEquatable extends Equatable {
  const CollectionEquatable({
    required this.list,
    required this.map,
    required this.set,
  });

  final List<int> list;
  final Map<String, int> map;
  final Set<int> set;

  @override
  List<Object> get props => [list, map, set];
}

@immutable
class Collection {
  const Collection({
    required this.list,
    required this.map,
    required this.set,
  });

  final List<int> list;
  final Map<String, int> map;
  final Set<int> set;

  @override
  bool operator ==(Object other) =>
      other is Collection &&
      map.length == other.map.length &&
      set.length == other.set.length &&
      _listEquals(list, other.list) &&
      map.entries.every((entry) => other.map[entry.key] == entry.value) &&
      set.containsAll(other.set);

  static bool _listEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hash(list, map, set);
}

void reportDifference(String name, int a, int b) {
  // show how many more runs a is than b
  final difference = a - b;
  final percent = (difference / b) * 10000;
  print('$name: $a runs, $difference more than $b (${percent.floor() / 100}%)');
}

void main() {
  final empty1 = _runBenchmark('EmptyEquatable', (_) => EmptyEquatable());

  final empty2 = _runBenchmark('Empty', (_) => Empty());

  reportDifference('Empty', empty2, empty1);

  final prim1 = _runBenchmark(
    'PrimitiveEquatable',
    (index) => PrimitiveEquatable(
      integer: index,
      string: '$index',
      boolean: index.isEven,
    ),
  );

  final prim2 = _runBenchmark(
    'Primitive',
    (index) => Primitive(
      integer: index,
      string: '$index',
      boolean: index.isEven,
    ),
  );

  reportDifference('Primitive', prim2, prim1);

  final coll1 = _runBenchmark(
    'CollectionEquatable (static, small)',
    (index) => CollectionEquatable(
      list: List.generate(1, (_) => 42),
      map: Map.fromEntries(
        // ignore: prefer_const_constructors
        List.generate(1, (_) => MapEntry('42', 42)),
      ),
      set: Set.from(List.generate(1, (_) => 42)),
    ),
  );

  final coll2 = _runBenchmark(
    'Collection (static, small)',
    (index) => Collection(
      list: List.generate(1, (_) => 42),
      map: Map.fromEntries(
        // ignore: prefer_const_constructors
        List.generate(1, (_) => MapEntry('42', 42)),
      ),
      set: Set.from(List.generate(1, (_) => 42)),
    ),
  );

  reportDifference('Collection (static, small)', coll2, coll1);

  final coll3 = _runBenchmark(
    'CollectionEquatable (static, medium)',
    (index) => CollectionEquatable(
      list: List.generate(10, (_) => 42),
      map: Map.fromEntries(
        // ignore: prefer_const_constructors
        List.generate(10, (_) => MapEntry('42', 42)),
      ),
      set: Set.from(List.generate(10, (_) => 42)),
    ),
  );

  final coll4 = _runBenchmark(
    'Collection (static, medium)',
    (index) => Collection(
      list: List.generate(10, (_) => 42),
      map: Map.fromEntries(
        // ignore: prefer_const_constructors
        List.generate(10, (_) => MapEntry('42', 42)),
      ),
      set: Set.from(List.generate(10, (_) => 42)),
    ),
  );

  reportDifference('Collection (static, medium)', coll4, coll3);

  final coll5 = _runBenchmark(
    'CollectionEquatable (static, large)',
    (index) => CollectionEquatable(
      list: List.generate(100, (_) => 42),
      map: Map.fromEntries(
        // ignore: prefer_const_constructors
        List.generate(100, (_) => MapEntry('42', 42)),
      ),
      set: Set.from(List.generate(100, (_) => 42)),
    ),
  );

  final coll6 = _runBenchmark(
    'Collection (static, large)',
    (index) => Collection(
      list: List.generate(100, (_) => 42),
      map: Map.fromEntries(
        // ignore: prefer_const_constructors
        List.generate(100, (_) => MapEntry('42', 42)),
      ),
      set: Set.from(List.generate(100, (_) => 42)),
    ),
  );

  reportDifference('Collection (static, large)', coll6, coll5);

  final callD1 = _runBenchmark(
    'CollectionEquatable (dynamic, small)',
    (index) => CollectionEquatable(
      list: List.generate(1, (i) => index + i),
      map: Map.fromEntries(
        List.generate(1, (i) => MapEntry('${index + i}', index + i)),
      ),
      set: Set.from(List.generate(1, (i) => index + i)),
    ),
  );

  final callD2 = _runBenchmark(
    'Collection (dynamic, small)',
    (index) => Collection(
      list: List.generate(1, (i) => index + i),
      map: Map.fromEntries(
        List.generate(1, (i) => MapEntry('${index + i}', index + i)),
      ),
      set: Set.from(List.generate(1, (i) => index + i)),
    ),
  );

  reportDifference('Collection (dynamic, small)', callD2, callD1);

  final callD3 = _runBenchmark(
    'CollectionEquatable (dynamic, medium)',
    (index) => CollectionEquatable(
      list: List.generate(10, (i) => index + i),
      map: Map.fromEntries(
        List.generate(10, (i) => MapEntry('${index + i}', index + i)),
      ),
      set: Set.from(List.generate(10, (i) => index + i)),
    ),
  );

  final callD4 = _runBenchmark(
    'Collection (dynamic, medium)',
    (index) => Collection(
      list: List.generate(10, (i) => index + i),
      map: Map.fromEntries(
        List.generate(10, (i) => MapEntry('${index + i}', index + i)),
      ),
      set: Set.from(List.generate(10, (i) => index + i)),
    ),
  );

  reportDifference('Collection (dynamic, medium)', callD4, callD3);

  final callD5 = _runBenchmark(
    'CollectionEquatable (dynamic, large)',
    (index) => CollectionEquatable(
      list: List.generate(100, (i) => index + i),
      map: Map.fromEntries(
        List.generate(100, (i) => MapEntry('${index + i}', index + i)),
      ),
      set: Set.from(List.generate(100, (i) => index + i)),
    ),
  );

  final callD6 = _runBenchmark(
    'Collection (dynamic, large)',
    (index) => Collection(
      list: List.generate(100, (i) => index + i),
      map: Map.fromEntries(
        List.generate(100, (i) => MapEntry('${index + i}', index + i)),
      ),
      set: Set.from(List.generate(100, (i) => index + i)),
    ),
  );

  reportDifference('Collection (dynamic, large)', callD6, callD5);
}

int _runBenchmark(String name, Object Function(int index) create) {
  const poolSize = 100;
  final pool = List.generate(poolSize, create);
  final poolA = [...pool]..shuffle();
  final poolB = [...pool]..shuffle();
  bool? result; // so that the loop isn't optimized out
  final benchmark = syncBenchmark(name, () {
    for (var i = 0; i < poolSize; i++) {
      result = poolA[i] == poolB[i];
    }
  })
    ..report(units: poolSize);
  assert(result != null, 'result should be defined.');
  return benchmark.runs;
}
