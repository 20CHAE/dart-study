//p205 getter, setter를 사용해 더 단순하게 작성가능

class Integer {
  late int _value;
  Integer([int givenValue = 0]) {
    _value = givenValue;
  }

  //getter 사용하기 ---------------------------
  //반환할자료타입 get 함수명 => 반환할값;
  String get returnString => "$_value";

  //setter 사용하기 ---------------------------
  //set 함수명(사용자입력값) => 변경할내용;
  set changeNumber(int givenValue) => _value = givenValue;
}

void main() {
  var int1 = Integer();
  var int2 = Integer(3);

  // getter함수 이용해 값 반환-------------
  print(int1.returnString);

  // setter------------------------------
  // 클래스.setter함수 = 변경할 값;
  int1.changeNumber = 5;
  print(int1.returnString); //출력해서 확인
}
