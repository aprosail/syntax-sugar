import 'dart:math';

T? nullableMin<T extends num>(T? a, T? b) {
  if (a == null && b == null) return null;
  if (a != null && b == null) return a;
  if (a == null && b != null) return b;
  assert(a != null && b != null, '$a and $b must all not null here');
  return min(a!, b!);
}

T? nullableMax<T extends num>(T? a, T? b) {
  if (a == null && b == null) return null;
  if (a != null && b == null) return a;
  if (a == null && b != null) return b;
  assert(a != null && b != null, '$a and $b must all not null here');
  return max(a!, b!);
}
