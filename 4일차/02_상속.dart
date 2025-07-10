//p197 상속

//01에서 만든 클래스
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

//새로운 클래스 생성
// newInteger클래스는 Integer클래스의 내용을 상속한다.
class newInteger extends Integer {
  //리스트 생성
  List<int> _list = [];

  //생성자
  //_value 인스턴스 변수를 생성하지 않아도 Integer에서 만든걸 가져와서 씀
  newInteger([int givenValue = 0]) {
    _value = givenValue;
  }
}

void main() {
  var newNum1 = newInteger();
  var newNum2 = newInteger(3);

  print(newNum1.add(4)); // 0에서 4를 더한 값 4를 가져옴
  print(newNum2.get()); // 들어있는 값 3을 가져옴

  //런타임타입 알아보는 메서드임.
  print(newNum1.runtimeType);
}
