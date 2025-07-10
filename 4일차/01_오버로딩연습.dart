// 오버로딩 해보기 + - * /

class Integer {
  //인스턴스변수 선언
  late num _value;
  //생성자
  Integer(num givenValue) {
    _value = givenValue;
  }
  //get함수
  num get() {
    return _value;
  }

  //(1)더하기
  Integer operator +(Integer givenValue) {
    return Integer(_value + givenValue.get());
  }

  //(2)빼기
  Integer operator -(Integer givenValue) {
    return Integer(_value - givenValue.get());
  }

  //(3)곱하기
  Integer operator *(Integer givenValue) {
    return Integer(_value * givenValue.get());
  }

  //(4)나누기 더블 !!!
  // double이라서 위에서 받을 때 double과 int를 같이 쓸 수 있는 num으로 받아야함!
  Integer operator /(Integer givenValue) {
    return Integer(_value / givenValue.get());
  }
}

void main() {
  var i = Integer(8);
  var j = Integer(12);

  //(1)
  var a = i + j;
  print(a.get());

  //(2)
  var b = i - j;
  print(b.get());

  //(3)
  var c = i * j;
  print(c.get());
}
