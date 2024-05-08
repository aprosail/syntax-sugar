extension AllToString<T> on Iterable<T> {
  Set<String> toStringSet() => toStringList().toSet();

  List<String> toStringList() {
    final linearList = toList(growable: false);
    return List.generate(length, (i) => linearList[i].toString());
  }
}

extension RegexpMatchOneOf on Iterable<String> {
  /// Generate a regular expression that
  /// matches any of the strings in the iterable.
  RegExp get regexp {
    final linearList = toList(growable: false);
    final escaped = List.generate(length, (i) => RegExp.escape(linearList[i]));
    return RegExp('(${escaped.join('|')}})');
  }
}
