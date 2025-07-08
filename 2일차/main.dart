void main() {
  //
  var num1 = 1 == 1;
  var num2 = 2 == "2";
  print(num1 || num2);

  //
  bool a = 1 == 0;
  bool b = 2 != 0;
  print(a);
  print(b);

  //if ~ else ~ 조건문
  bool c = true;
  if (c) {
    print("c is true");
  } else {
    print("c is false");
  }

  //if else 조건문
  bool d = false;
  if (d) {
    print("d is true");
  } else if (false) {
    print("d is false");
  }

  // switch 조건문
  // 1.각각의 case에는 break를 줄 것.
  // 2.default를 마지막에 생성할 것. (원하는 케이스가 없는 경우)
  String e = "banana";

  switch (e) {
    case '1':
      print('switch is false');
      break;
    case "banana":
      print('switch is true');
      break;
    default:
      print("no case");
      break;
  }

  // switch를 if 로 바꿔보기
  if (e == "1") {
    print('switch is false2');
  } else if (e == "banana") {
    print('switch is true2');
  } else {
    print("no case2");
  }

  //assert 조건문 (**사용은 매우 드물다.)
  //조건이 true면 다음 코드 실행
  //조건이 false면 바로 실행중단
  assert(e == "banana");
  print("assert is true");

  //for문
  var count = 0;
  var number = 0;
  for (number = 0; number < 3; number++) {
    print("hello");
  }
}
