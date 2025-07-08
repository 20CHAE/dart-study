//int자료형의 메서드들
// number.isOdd 등이 있음

//p118함수 만들기
void printMessage(var header, var message) {
  print("$message");
}

void main() {
  // p120 int클래스 이해하기
  print("----Integer Class----");
  int iInteger = 3;
  printMessage("1-1", iInteger.abs()); //3 절댓값
  printMessage("1-2", iInteger.gcd(6)); //3 최대 공약수
  printMessage("1-3", iInteger.toString()); //3 문자열로 변환
  printMessage("1-4", 2.abs()); //2
  printMessage("1-5", 2.gcd(6)); //2
  printMessage("1-6", 2.toString()); //2

  // p122 double 클래스 이해하기
  print("----Double Class----");
  double dDouble = 3.8;
  printMessage("2-1", dDouble.abs()); //3.8 절댓값
  printMessage("2-2", dDouble.toString()); //3.8 문자열로 변환
  printMessage("2-3", dDouble.floor()); //3 소수점 삭제
  printMessage("2-4", dDouble.round()); //4 가까운 정수
  printMessage("2-5", 1.8.abs()); //1.8
  printMessage("2-6", 1.8.toString()); //1.8
  printMessage("2-7", 1.8.floor()); //1
  printMessage("2-8", 1.8.round()); //2

  // p124 string 클래스 이해하기
  print("----String Class----");
  String sString = "Hello, Dart!";
  printMessage("3-1", sString.toLowerCase()); //소문자로
  printMessage("3-2", sString.toUpperCase()); //대문자로
  printMessage("3-3", sString.length); //문자열 길이
  printMessage("3-4", sString.substring(0, 5)); // 0부터 5글자까지만 출력해라
  printMessage("3-5", sString[11]); //11번째 글자 출력

  // p125 Bool Class 이해하기
  print("----Bool Class----");
  bool bBoolean = true;
  printMessage("4-1", bBoolean.toString()); //문자열로 변환

  // p126 is/ is! 연산자
  // 객체가 어떤 클래스타입인지 판별함.
  // 결과값은 bool
  print("----class type operators----");
  printMessage("5-1", iInteger is int);
  printMessage("5-2", dDouble is double);
  printMessage("5-3", sString is String);
  printMessage("5-4", bBoolean is bool);
  printMessage("5-5", iInteger is! int);
  printMessage("5-6", dDouble is! double);
  printMessage("5-7", sString is! String);
  printMessage("5-8", bBoolean is! bool);
  print("--------");
  var tmpS = "String";
  printMessage("5-9", tmpS is String);
  num tmpI = 3.3;
  printMessage("5-10", tmpI is String);
  printMessage("5-11", tmpI is int);
  printMessage("5-12", tmpI is double);

  // p128 연습문제 3번
  // int클래스의 bitLength 프로퍼티 : 정수를 저장하는데 필요한 최소비트수
  print("----bitLength 함수알아보기----");
  print(2.bitLength); //2 (2를 비트로 변환 00000010 이므로 2자리 필요)
  print(4.bitLength); //3 (4는 00000100)

  //String클래스의 replaceAll() 메서드
  //쓰는 중
}


//** 프로퍼티와 메서드의 차이점
//메서드:객체의 행동(functionality)을 캡슐화하여 특정 작업 수행
//프로퍼티:객체의 속성(data)
//즉, 메서드는 객체가 할 수 있는 일, 프로퍼티는 객체가 가지고 있는 정보라고 할 수 있습니다. 
