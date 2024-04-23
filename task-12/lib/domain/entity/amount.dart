/// Класс, описывающий количество товара.
sealed class Amount {
  int get value;
}

/// Класс, описывающий количество товара в граммах.
class Grams implements Amount {
  @override
  final int value;
  Grams(this.value);

  @override
  String toString() {
    return '${(value / 1000).toStringAsFixed(0)} кг';
  }
}

/// Класс, описывающий количество товара в штуках.
class Quantity implements Amount {
  @override
  final int value;
  Quantity(this.value);

  @override
  String toString() {
    return '$value шт';
  }
}
