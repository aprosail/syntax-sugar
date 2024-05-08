extension AllToString<T> on Iterable<T> {
  Set<String> toStringSet() => toStringList().toSet();

  List<String> toStringList() {
    final linearList = toList(growable: false);
    return List.generate(length, (i) => linearList[i].toString());
  }
}
