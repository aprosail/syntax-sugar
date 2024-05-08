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

extension RegexpMatchOneOf on Iterable<String> {
  /// Generate a regular expression that
  /// matches any of the strings in the iterable.
  RegExp get regexp {
    final linearList = toList(growable: false);
    final escaped = List.generate(length, (i) => RegExp.escape(linearList[i]));
    return RegExp('(${escaped.join('|')}})');
  }
}
