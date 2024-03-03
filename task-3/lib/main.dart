class Computer {
  final String brand;
  final String model;
  final int year;
  bool isWorking;
  bool isPortable;
  Mouse mouse;

  Computer(this.brand, this.model, this.year,
      {this.isWorking = true, this.isPortable = false, required this.mouse});

  Computer.laptop(this.brand, this.model, this.year,
      {this.isWorking = true, required this.mouse})
      : isPortable = true;

  void turnOn() {
    if (!isWorking) {
      print('Компьютер включается');
      isWorking = true;
    } else {
      print('Компьютер уже включен!');
    }
  }

  void turnOff() {
    if (isWorking) {
      print('Компьютер выключается');
      isWorking = false;
    } else {
      print('Компьютер уже выключен!');
    }
  }

  void getInfo() {
    print(
        'Компьютер $brand $model $year года с мышкой ${mouse.brand} ${mouse.model}');
  }
}

class Mouse {
  final String brand;
  final String model;
  int buttons;

  Mouse(this.brand, this.model, this.buttons);
}

void main() {
  Mouse wirelessMouse = Mouse('Logitech', 'M510', 5);
  Mouse magicMouse = Mouse('Apple', 'Magic Mouse 3', 3);

  Computer desktop = Computer('Dell', 'Inspiron', 2021, mouse: wirelessMouse);
  desktop.turnOn();
  desktop.turnOff();

  Computer laptop =
      Computer.laptop('Apple', 'MacBook Air', 2020, mouse: magicMouse);

  laptop.getInfo();
  desktop.getInfo();
}
