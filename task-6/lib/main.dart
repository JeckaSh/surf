class Plane {
  Plane({required this.model, required this.crew, this.type});

  String model;
  int crew;
  String? type;

  @override
  String toString() {
    return 'Это самолёт $model. Количество экипажа: $crew';
  }

  void fly() {
    print('$model летит');
  }

  void landing() {
    print('$model успешно приземлился');
  }
}

class MilitaryPlane extends Plane {
  MilitaryPlane(
      {required super.model,
      required super.crew,
      required this.weapon,
      required this.rocket});

  String? type = 'Военный';
  PlaneWeapon weapon;
  PlaneRocket rocket;

  @override
  String toString() {
    return '''
    Это $type самолёт $model. Количество экипажа: $crew.
    Он имеет на борту ${weapon.toString()}
    И ${rocket.toString()}
    ''';
  }

  void attack() {
    weapon.fire();
  }

  void rocketAttack() {
    rocket.fire();
  }

  @override
  void landing() {
    print('Все цели уничтожены! $model идёт на посадку!');
  }

  void mission() {
    fly();
    attack();
    rocketAttack();
    landing();
  }
}

class PlaneWeapon {
  PlaneWeapon(
      {required this.model, required this.caliber, required this.ammunition});

  String model;
  String caliber;
  int ammunition;

  @override
  String toString() {
    return 'Орудие $model. Калибр: $caliber. Боезапас: $ammunition';
  }

  void fire() {
    print('Орудие $model стреляет!');
  }
}

class PlaneRocket {
  PlaneRocket({required this.model, required this.ammunition});

  String model;
  int ammunition;

  @override
  String toString() {
    return 'Ракеты $model. Боезапас: $ammunition';
  }

  void fire() {
    print('Ракеты $model запущены!');
  }
}

class CargoPlane extends Plane {
  CargoPlane({required super.model, required super.crew, required this.cargo});

  String? type = 'Грузовой';
  List<String> cargo;

  @override
  String toString() {
    return '''
    Это $type самолёт $model. Количество экипажа: $crew.
    В грузовом отсеке у него:
    ${cargo.toString()}
    ''';
  }
}

class PassengerPlane extends Plane {
  PassengerPlane(
      {required super.model, required super.crew, required this.passenger});

  String? type = 'Пассажирский';
  int passenger;

  @override
  String toString() {
    return '''
    Это $type самолёт $model. Количество экипажа: $crew.
    Максимальное количество пассажиров: $passenger
    ''';
  }

  void addPassenger() {
    print('$model производит посадку пассажиров.');
  }

  void removePassenger() {
    print('$model производит выгрузку пассажиров');
  }

  void flight() {
    addPassenger();
    fly();
    landing();
    removePassenger();
  }
}

void main() {
  var airplane = Plane(model: 'Кукурузник', crew: 1);
  print(airplane);
  print('\n');
  airplane.fly();
  airplane.landing();
  print('\n');

  var gsh30 = PlaneWeapon(model: 'ГШ 30-1', caliber: '30мм', ammunition: 150);
  var r77_1 = PlaneRocket(model: 'Р-77-1', ammunition: 12);

  var military = MilitaryPlane(
      model: 'Истребитель', crew: 2, weapon: gsh30, rocket: r77_1);

  print(military);
  military.mission();
  print('\n');

  List<String> militaryCargo = ['Боеприпасы', 'Оружие', 'Ракеты'];
  List<String> civilCargo = ['Одежда', 'Электроника', 'Мебель'];

  var cargoPlane1 = CargoPlane(model: 'АН-12', crew: 4, cargo: militaryCargo);
  var cargoPlane2 =
      CargoPlane(model: 'Boeing 747-8F', crew: 4, cargo: civilCargo);

  print(cargoPlane1);
  print('\n');
  print(cargoPlane2);
  print('\n');

  var passenger =
      PassengerPlane(model: 'Airbus A330-200', crew: 8, passenger: 406);
  print(passenger);
  print('\n');
  passenger.flight();
}
