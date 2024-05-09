extension StringModifyChain on String {
  /// Same as using `$this$another`.
  ///
  /// This method is not efficient when being called frequently.
  /// If you'd like to call it multiple times,
  /// please consider using [StringBuffer] instead.
  String add(Object? another) => '$this$another';

  /// Same as using `$prefix$this`.
  ///
  /// This method is not efficient when being called frequently.
  /// If you'd like to call it multiple times,
  /// please consider using [StringBuffer] instead.
  String addPrefix(Object? prefix) => '$prefix$this';
}
