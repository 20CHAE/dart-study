// p203

class Integer {
  late int _value;

  // 기존 생성자
  // Integer([int givenValue = 0]) {
  //   _value = givenValue;
  // }

  // 바뀐 생성자 -------------------------
  Integer([int givenValue = 0]) : _value = givenValue;

  int get() {
    return _value;
  }

  void set(int getValue) {
    _value = getValue;
  }

  String get returnString => "$_value";
  set changeInteger(int givenValue) => _value = givenValue;

  //
  String get asString => "$_value";
}

class newInteger extends Integer {
  //리스트 생성
  List<int> _list = [];
  //생성자
  //_value 인스턴스 변수를 생성하지 않아도 Integer에서 만든걸 가져와서 씀
  newInteger([int givenValue = 0]) {
    _value = givenValue;
  }

  //오버라이드
  //Integer클래스에 있던 코드에서 이 기능들을 추가해줘
  @override
  void set(int givenValue) {
    _list.add(_value);
    super.set(givenValue);
  }

  //getter함수 생성
  @override
  String get asString => "현재 값 : $_value, 기존에 지정했던 값들 : $_list";

  // getOld
  //
  List getOld() {
    return _list;
  }
}

void main() {
  var newNum1 = newInteger();
  // var newNum2 = newInteger(3);

  //
  newNum1.set(9);
  //2로 값바꿔줘 Integer클래스의 changeInteger (setter메서드) 동작함
  //9는 list로 넘어가지 않고 강제로 2로 바뀜
  newNum1.changeInteger = 2;
  print(newNum1.get());

  newNum1.set(10);
  print(newNum1.getOld()); // _list 리턴해줘
  print(newNum1.asString);
}
