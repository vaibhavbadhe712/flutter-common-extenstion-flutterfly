extension ListExtensions<T> on List<T> {
  /// Safely gets element at index
  T? safeGet(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    }
    return null;
  }

  /// Checks if list is null or empty
  bool get isNullOrEmpty => isEmpty;

  /// Checks if list is not null or empty
  bool get isNotNullOrEmpty => isNotEmpty;

  /// Gets random element
  T? get random {
    if (isEmpty) return null;
    return this[(DateTime.now().millisecond) % length];
  }

  /// Chunks list into smaller lists
  List<List<T>> chunk(int size) {
    List<List<T>> chunks = [];
    for (int i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  /// Removes duplicates
  List<T> get unique => toSet().toList();

  /// Gets second element safely
  T? get second => length > 1 ? this[1] : null;

  /// Gets third element safely
  T? get third => length > 2 ? this[2] : null;

  /// Gets second last element safely
  T? get secondLast => length > 1 ? this[length - 2] : null;
}

extension NullableListExtensions<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  List<T> get orEmpty => this ?? [];
}
