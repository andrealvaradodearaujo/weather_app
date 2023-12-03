extension StringExtension on String {
  /// Extension method to normalize a string by replacing accented characters with their non-accented equivalents.
  ///
  /// This extension method helps standardize input strings by removing accent marks
  /// from characters, making it suitable for case-insensitive and accent-insensitive
  /// comparisons.
  ///
  /// Example:
  /// ```dart
  /// String originalString = "São Paulo";
  /// String normalizedString = originalString.normalize();
  /// print(normalizedString); // Output: Sao Paulo
  /// ```
  ///
  /// Returns:
  /// A new string with accented characters replaced by their non-accented equivalents.
  String normalize() {
    return replaceAll(RegExp('[áãâäà]'), 'a')
        .replaceAll(RegExp('[éêëè]'), 'e')
        .replaceAll(RegExp('[íïìî]'), 'i')
        .replaceAll(RegExp('[óõôöò]'), 'o')
        .replaceAll(RegExp('[úüùû]'), 'u');
  }
}
