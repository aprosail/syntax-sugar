import 'iterable.dart';

/// Chain style programming syntax sugar for regular expressions on strings.
/// This extension directly mapped the [RegExp] interface in the `dart:core`.
extension RegexpMatchChain on String {
  bool hasMatch(RegExp regexp) => regexp.hasMatch(this);

  RegExpMatch? matchFirst(RegExp regexp) => regexp.firstMatch(this);

  /// Attention that the iterable will be lazy evaluated.
  Iterable<RegExpMatch> matchAll(RegExp regexp, [int start = 0]) =>
      regexp.allMatches(this, start);
}

extension MatchOneOf on String {
  /// Match the first of any item in the set.
  ///
  /// Attention that any item not a string will be converted to string.
  /// Because regular expression will only work on string.
  /// The conversion will be done by [toString] method.
  RegExpMatch? matchFirstOf(Set items) => matchFirst(items.regexp);

  /// Match any of the items in the set.
  ///
  /// Attention that any item not a string will be converted to string.
  /// Because regular expression will only work on string.
  /// The conversion will be done by [toString] method.
  ///
  /// Attention that the iterable will be lazy evaluated.
  /// So you can use it in a for loop.
  /// When you just call the first one of the result,
  /// it will not match the whole string to avoid waste.
  Iterable<RegExpMatch> matchAllOf(Set items) => matchAll(items.regexp);
}

extension MatchIndexOf on String {
  /// Same as [indexOf], but the parameter can be any type.
  ///
  /// If the parameter is an iterable, it will match any item inside,
  /// and all non-string item will be converted to string using [toString].
  /// Otherwise, it will match the string of the parameter (also [toString]).
  ///
  /// If the parameter is an empty iterable, then it will match
  /// the empty iterable to string, using "[]" or "{}" as the pattern.
  int matchIndexOf(Object? match, [int start = 0]) => match is Iterable
      ? match.isNotEmpty
          ? indexOf(match.toSet().regexp, start)
          : indexOf(match.toString())
      : indexOf(match.toString(), start);

  /// Same as [lastIndexOf], but the parameter can be any type.
  ///
  /// If the parameter is an iterable, it will match any item inside,
  /// and all non-string item will be converted to string using [toString].
  /// Otherwise, it will match the string of the parameter (also [toString]).
  ///
  /// If the parameter is an empty iterable, then it will match
  /// the empty iterable to string, using "[]" or "{}" as the pattern.
  int matchLastIndexOf(Object? match, [int? start]) => match is Iterable
      ? match.isNotEmpty
          ? lastIndexOf(match.toSet().regexp, start)
          : lastIndexOf(match.toString())
      : lastIndexOf(match.toString(), start);
}
