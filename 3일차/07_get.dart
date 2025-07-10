//p192 get메서드

class Integer {
  late int _value;
  Integer([int givenValue = 0]) {
    _value = givenValue;
  }

  //get메서드 생성 --------------------------
  // get을 실행하면 값을 리턴한다.
  // 이름 변경 가능
  int get() {
    return _value;
  }
}

class TimemachineInteger extends Integer {}

void main() {
  var int1 = Integer();
  var int2 = Integer(3);

  //인스턴수 변수가 아닌 get을 써서 값을 리턴해줬다.-----------
  print(int1.get()); // 기본값인 0이 출력
  print(int2.get()); // 3을 넣었기에 저장된 3이 출력
}
