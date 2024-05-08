import 'dart:math';

T? nullableMin<T extends num>(T? a, T? b) {
  if (a == null && b == null) return null;
  if (a == null) return b;
  if (b == null) return a;
  return min(a, b);
}

T? nullableMax<T extends num>(T? a, T? b) {
  if (a == null && b == null) return null;
  if (a == null) return b;
  if (b == null) return a;
  return max(a, b);
}
