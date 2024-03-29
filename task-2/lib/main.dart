enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  final int areaInHectare;
  final List<String> crops;
  final List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  /// Переопределяем оператор "==", чтобы сравнивать объекты по значению.
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

void main() {
  final fullMap = {...mapAfter2010, ...mapBefore2010};
  List<AgriculturalMachinery> allMachine = [];

  // общий список машин
  for (var Territory in fullMap.values) {
    for (var AgriculturalMachinery in Territory) {
      allMachine.addAll(AgriculturalMachinery.machineries);
    }
  }

  // исключить повторения
  Set<AgriculturalMachinery> result = allMachine.toSet();
  List<AgriculturalMachinery> uniqueMachine = result.toList();

  var totalAge = 0;
  final currentDate = DateTime.now().year;

  // средний возраст всей техники
  for (var element in uniqueMachine) {
    final age = currentDate - element.releaseDate.year;
    totalAge = totalAge + age;
  }
  var averageAge = totalAge / uniqueMachine.length;

  // сортировка по возрасту
  uniqueMachine.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));

  // список самых старых машин
  List<AgriculturalMachinery> oldestMachine =
      uniqueMachine.sublist(0, uniqueMachine.length ~/ 2);

  var oldestAge = 0;

  for (var element in oldestMachine) {
    final age = currentDate - element.releaseDate.year;
    oldestAge = oldestAge + age;
  }
  var oldestAverageAge = oldestAge / oldestMachine.length;

  // вывод результатов в консоль
  print('Средний возраст всей техники: $averageAge');
  print('Средний возраст самой старой техники: $oldestAverageAge');
}
