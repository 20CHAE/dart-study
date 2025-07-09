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
  var number = 0;
  for (number = 0; number < 3; number++) {
    print("hello");
  }

  //for문으로 구구단 만들기
  //gugudan.dart파일 참조

  //while문
  //무한루프에 유의한다.
  int count1 = 0;

  while (count1 <= 5) {
    print(count1);
    count1++;
  }

  //do ~ while문
  //일단 실행하고 while조건이 맞을때까지 반복
  //잘쓰지 않는다

  int i2 = 1;
  int count2 = 1;

  do {
    print(i2);
    count2++;
  } while (count2 < 5);

  //continue와 break
  //교재 p.99
  int i3 = 0;
  for (i3; i3 < 10; i3++) {
    print("i3 is $i3");

    if (i3 > 4) {
      print("$i3 is bigger than 4");
      break;
    } else if (i3 < 4) {
      print("$i3 is less than 4");
      continue; //왼쪽 continue는 삭제해도 무관하다.
    }
  }

  //p101 연습문제 2-4
  //gugudan.dart 참조
}
