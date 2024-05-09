import 'package:syntax_sugar/syntax_sugar.dart';
import 'package:test/test.dart';

void main() {
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
}
