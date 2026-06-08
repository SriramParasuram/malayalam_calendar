/// Utilities for rendering numbers in Malayalam (Kerala) numerals.
///
/// Malayalam digits occupy the Unicode block U+0D66..U+0D6F.
class MalayalamNumerals {
  MalayalamNumerals._();

  static const List<String> _digits = [
    '\u0D66', // 0
    '\u0D67', // 1
    '\u0D68', // 2
    '\u0D69', // 3
    '\u0D6A', // 4
    '\u0D6B', // 5
    '\u0D6C', // 6
    '\u0D6D', // 7
    '\u0D6E', // 8
    '\u0D6F', // 9
  ];

  /// Converts a non-negative integer to its Malayalam numeral string.
  static String fromInt(int value) {
    if (value < 0) return value.toString();
    return value.toString().split('').map((c) => _digits[int.parse(c)]).join();
  }
}
