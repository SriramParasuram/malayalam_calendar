/// English and Malayalam names for the Gregorian months.
class MonthNames {
  MonthNames._();

  static const List<String> english = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// Malayalam renderings of the Gregorian month names.
  static const List<String> malayalam = [
    '\u0D1C\u0D28\u0D41\u0D35\u0D30\u0D3F', // ജനുവരി
    '\u0D2B\u0D46\u0D2C\u0D4D\u0D30\u0D41\u0D35\u0D30\u0D3F', // ഫെബ്രുവരി
    '\u0D2E\u0D3E\u0D7C\u0D1A\u0D4D\u0D1A\u0D4D', // മാർച്ച്
    '\u0D0F\u0D2A\u0D4D\u0D30\u0D3F\u0D7D', // ഏപ്രിൽ
    '\u0D2E\u0D47\u0D2F\u0D4D', // മേയ്
    '\u0D1C\u0D42\u0D7A', // ജൂൺ
    '\u0D1C\u0D42\u0D32\u0D48', // ജൂലൈ
    '\u0D13\u0D17\u0D38\u0D4D\u0D31\u0D4D\u0D31\u0D4D', // ഓഗസ്റ്റ്
    '\u0D38\u0D46\u0D2A\u0D4D\u0D31\u0D4D\u0D31\u0D02\u0D2C\u0D7C', // സെപ്റ്റംബർ
    '\u0D12\u0D15\u0D4D\u0D1F\u0D4B\u0D2C\u0D7C', // ഒക്ടോബർ
    '\u0D28\u0D35\u0D02\u0D2C\u0D7C', // നവംബർ
    '\u0D21\u0D3F\u0D38\u0D02\u0D2C\u0D7C', // ഡിസംബർ
  ];

  static String englishOf(int month) => english[(month - 1) % 12];
  static String malayalamOf(int month) => malayalam[(month - 1) % 12];
}
