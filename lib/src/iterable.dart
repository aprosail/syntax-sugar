extension SetAllToString on Set {
  Set allToString() {
    final handler = <String>{};
    for (final item in this) handler.add(item.toString());
    return handler;
  }
}

extension ListAllToString on List {
  List allToString() => List.generate(length, (i) => this[i].toString());
}
