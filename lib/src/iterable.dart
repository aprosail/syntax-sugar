extension AllToString<T> on Iterable<T> {
  /// Try to use more [toStringList] if possible for better performance.
  /// This method will also call such method exactly.
  Set<String> toStringSet() => toStringList().toSet();

  /// Attention that the string list is not growable.
  List<String> toStringList() {
    // Disable growable to make the list linear to improve performance.
    final linearList = toList(growable: false);
    return List.generate(length, (i) => linearList[i].toString());
  }
}

extension RegexpMatchOneOf on Set {
  /// Generate a regular expression that any item inside this set.
  ///
  /// Attention that if an item in that set is not a string,
  /// it will be converted to string by [toString].
  RegExp get regexp {
    final linearList = toList(growable: false);
    final escaped = List.generate(
      length,
      (i) => RegExp.escape(linearList[i].toString()),
    );
    return RegExp('(${escaped.join('|')})');
  }
}
