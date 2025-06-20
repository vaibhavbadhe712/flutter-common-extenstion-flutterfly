extension StringExtensions on String {
  /// Capitalizes first letter of string
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  /// Capitalizes each word in string
  String capitalizeEachWord() {
    return split(" ").map((word) => word.capitalizeFirst()).join(" ");
  }

  /// Converts to title case
  String get titleCase => capitalizeEachWord();

  /// Checks if string is email
  bool get isEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Checks if string is phone number
  bool get isPhoneNumber {
    return RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(this);
  }

  /// Checks if string is URL
  bool get isUrl {
    return RegExp(r'^https?://').hasMatch(this);
  }

  /// Removes all whitespace
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Checks if string is numeric
  bool get isNumeric => num.tryParse(this) != null;

  /// Converts string to int safely
  int? get toInt => int.tryParse(this);

  /// Converts string to double safely
  double? get toDouble => double.tryParse(this);

  /// Truncates string with ellipsis
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  /// Checks if string is empty or null
  bool get isNullOrEmpty => isEmpty;

  /// Checks if string is not empty
  bool get isNotNullOrEmpty => isNotEmpty;

  /// Reverses the string
  String get reversed => split('').reversed.join('');

  /// Counts words in string
  int get wordCount => trim().split(RegExp(r'\s+')).length;

  /// Removes HTML tags
  String get removeHtmlTags => replaceAll(RegExp(r'<[^>]*>'), '');
}

extension NullableStringExtensions on String? {
  /// Safe null check and operations
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  String get orEmpty => this ?? '';
}
