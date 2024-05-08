import 'iterable.dart';

/// Chain style programming syntax sugar for regular expressions on strings.
/// This extension directly mapped the [RegExp] interface in the `dart:core`.
extension RegexpMatchChain on String {
  bool hasMatch(RegExp regexp) => regexp.hasMatch(this);

  RegExpMatch? matchFirst(RegExp regexp) => regexp.firstMatch(this);

  Iterable<RegExpMatch> matchAll(RegExp regexp, [int start = 0]) =>
      regexp.allMatches(this, start);
}

extension MatchOneOf on String {
  /// Match the first of any of the strings in the [items] in this string.
  RegExpMatch? matchFirstOf(Iterable<String> items) => matchFirst(items.regexp);

  /// Match all of any of the strings in the [items] in this string.
  Iterable<RegExpMatch> matchAnyOf(Iterable<String> items) =>
      matchAll(items.regexp);
}
