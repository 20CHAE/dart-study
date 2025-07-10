//p196 오버로딩

class Integer {
  late int _value;

  Integer([int givenValue = 0]) {
    _value = givenValue;
  }

  int get() {
    return _value;
  }

  String get returnString => "$_value";
  set changeNumber(int givenValue) => _value = givenValue;

  //오버로딩 ----------------------------
  //기존에 있는 클래스에 함수를 추가해서 클래스를 강화
  //방법 : 반환값의자료형 함수명 (사용자입력값) {동작}
  //(1)
  // 더하기 함수
  int add(int givenValue) {
    return _value + givenValue;
  }

  // 빼기 함수
  int minus(int givenValue) {
    return _value - givenValue;
  }

  //(2)연산자를 함수로 만들어 쓰기
  //operator + : +를 함수로 쓸게
  int operator +(int givenValue) {
    return _value + givenValue;
  }

  //(3)
  Integer operator -(Integer givenValue) {
    //값을 result에 넣고
    var result = _value - givenValue.get();
    // 그 결과를 다시 integer클래스로 만듦
    var result2 = Integer(result);
    return result2;
  }

  //(4) 3번을 축약하면 이렇게 된다.
  Integer operator *(Integer givenValue) {
    return Integer(_value * givenValue.get());
  }
}

void main() {
  var num1 = Integer(5);
  var num2 = Integer(10);

  // (1)
  num1.add(2);
  print(num1.add(num2.get()));

  //(2)
  print(num1 + num2.get());
  // +를 함수로 사용
  // 함수끼리 더해서 값 리턴

  //(3)
  print(num1 - num2);
  var num3 = num1 - num2;
  print(num3.get());
}
