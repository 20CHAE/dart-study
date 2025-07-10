// 추상클래스 (Vehicle)에 drive 기능 추가
// Boat, Car 클래스 구현
// 각 클래스 별 drive함수 실행 시 다음 내용 출력하라
// [보트가 물 위를 떠다닙니다.] [자동차가 도로를 달려다닙니다.]

abstract class Vehicle {
  void drive() {}
}

class Boat implements Vehicle {
  @override
  void drive() {
    print("보트가 물 위를 떠다닙니다.");
  }
}

class Car implements Vehicle {
  @override
  void drive() {
    print("자동차가 도로를 달려다닙니다.");
  }
}

void main() {
  var boat = Boat();
  var car = Car();

  boat.drive();
  car.drive();
}
