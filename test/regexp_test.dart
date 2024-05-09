import 'package:syntax_sugar/syntax_sugar.dart';
import 'package:test/test.dart';

void main() {
  group('match iterable', () {
    test('match first of', () {
      final match = 'abcdef'.matchFirstOf({'bc', 123, true, 'de'});
      expect(match?.group(0), 'bc');
      expect(match?.start, 1);
    });

    test('match all of', () {
      final matches = 'abcdef'.matchAllOf({'bc', 123, true, 'de'});
      expect(matches.length, 2);
      expect(matches.map((e) => e.group(0)).toList(), ['bc', 'de']);
    });
  });

  group('match index of', () {
    test('resolve empty iterable', () {
      expect(<RegExpMatch>[].toString(), '[]');
      expect(<RegExpMatch>{}.toString(), '{}');
      expect('this is list []'.matchIndexOf([]), 13);
      expect('this is set {}'.matchIndexOf(<int>{}), 12);
      expect('this is list []'.matchLastIndexOf([]), 13);
      expect('this is set {}'.matchLastIndexOf(<int>{}), 12);

      // "{}" can either be a set or a map.
      expect('this is set {}'.matchIndexOf({}), -1);
      expect('this is set {}'.matchLastIndexOf({}), -1);
    });

    test('match index of', () {
      expect('abcdef'.matchIndexOf('bc'), 1);
      expect('this is true'.matchIndexOf(true), 8);
      expect('abcdef'.matchIndexOf({'bc', 123, true, 'de'}), 1);
      expect('abcdef'.matchIndexOf({'bc', 123, true, 'de'}, 2), 3);
    });

    test('match last index of', () {
      expect('abcdef'.matchLastIndexOf('bc'), 1);
      expect('this is true'.matchLastIndexOf(true), 8);
      expect('abcdef'.matchLastIndexOf({'bc', 123, true, 'de'}), 3);
      expect('abcdef'.matchLastIndexOf({'bc', 123, true, 'de'}, 2), 1);
    });
  });
}
