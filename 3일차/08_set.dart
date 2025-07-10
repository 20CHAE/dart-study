//p193 set으로 인스턴스변수 수정

class Integer {
  late int _value;
  Integer([int givenValue = 0]) {
    _value = givenValue;
  }

  int get() {
    return _value;
  }

  // set ------------------
  // 리턴값이 없기 때문에 void 사용
  // 함수 이름은 자유
  // 받는 값 변수이름은 자유임.getValue라고 임의로 지정함
  // ()소괄호 안에 사용자에게 값을 받아서 _value 값을 변경한다
  void set(int getValue) {
    _value = getValue;
  }
}

class TimemachineInteger extends Integer {}

void main() {
  var int1 = Integer();
  var int2 = Integer(3);

  print(int1.get()); // 기본값인 0이 출력
  print(int2.get()); // 3을 넣었기에 저장된 3이 출력

  //set 함수 사용--------------------------
  int1.set(10); //set함수에 요청. 10으로 바꿔줘.
  print(int1.get()); // 바뀐 값인 10으로 출력
}
