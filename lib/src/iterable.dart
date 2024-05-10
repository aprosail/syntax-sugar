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
  /// Attention that the set must not be empty,
  /// or the regexp will be invalid.
  /// (a blank bracket will match everything as empty match in the regexp rule)
  /// If the regexp might be empty, consider using [regexpOrEmpty] instead.
  /// Because there's no exception but only an assert here
  /// in order to improve performance.
  ///
  /// If an item in that set is not a string,
  /// it will be converted to string by [toString].
  RegExp get regexp {
    assert(isNotEmpty, 'set cannot be empty when generating regexp');
    final linearList = toList(growable: false);
    final escaped = List.generate(
      length,
      (i) => RegExp.escape(linearList[i].toString()),
    );
    return RegExp('(${escaped.join('|')})');
  }

  /// If the set is empty, return null. Otherwise, call [regexp] getter.
  RegExp? get regexpOrEmpty => isEmpty ? null : regexp;
}

/// Satisfy any of the conditions, and it wll return true.
bool satisfyAny(Set<bool> conditions) => conditions.any((element) => element);

/// Satisfy all of the conditions, and it wll return true.
bool satisfyAll(Set<bool> conditions) => conditions.every((element) => element);
