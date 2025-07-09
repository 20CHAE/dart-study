//p189

//Integer 클래스 생성함
class Integer {
  // 클래스 내에서 인스턴스변수를 미리 선언함
  late int _value;

  //생성자 : integer 클래스가 생성될 때, 인스턴스변수에 값을 담아줘
  //생성자는 클래스 이름과 동일할 것
  // 생성자이름(){};
  Integer([int givenValue = 0]) {
    //기본값을 0으로 줬기 때문에 대괄호 사용.
    _value = givenValue; //받는 값을 변수에 저장
  }
}

class TimemachineInteger extends Integer {}

void main() {
  var int1 = Integer(); //함수를 변수안에 담아줘
  var int2 = Integer(3);

  print(int1._value); // 기본값인 0이 출력
  print(int2._value); // 3을 넣었기에 저장된 3이 출력
}

// 그러나 _value를 사용하는 것은 직접적으로 인스턴스 변수의 이름이 노출 되는 것이다.
// 코드의 재사용을 위해 지양한다
// -> get 으로 넘어가서 재사용하기 좋은 코드 만들자.
