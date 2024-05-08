extension SetAllToString on Set {
  Set allToString() =>
      List.generate(length, (i) => toList()[i].toString()).toSet();
}

extension ListAllToString on List {
  List allToString() => List.generate(length, (i) => this[i].toString());
}
