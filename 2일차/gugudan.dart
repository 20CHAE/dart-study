void main() {
  //구구단 1단계 만들기

  var dan = 1;
  var number = 1;

  // for (number = 1; number < 10; number++) {
  //   print("$dan X $number = ${dan * number}");
  // }

  //구구단 9단계 만들기
  // for (dan = 1; dan < 10; dan++) {
  //   for (number = 1; number < 10; number++) {
  //     print("$dan X $number = ${dan * number}");
  //   }
  // }

  //p101 연습문제 2-4
  //구구단에서 짝수만 출력해보자

  var a = 1; //단
  var b = 1; //숫자

  // 1.for문 사용
  for (a; a <= 9; a++) {
    if (a % 2 == 1) {
      continue;
    } else {
      for (b; b <= 9; b++) {
        print("$a X $b = ${a * b}");
      }
      b = 1; //b값 초기화!
    }
  }

  // 강사님 방법
  int c, d;
  for (c = 2; c <= 8; c += 2) {
    for (d = 1; d < 10; d++) {
      print("$c X $d = ${c * d}");
    }
  }

  // 2. while문 사용
  // int e = 2, f = 1;

  // while (e <= 8) {
  //   while (f <= 9) {
  //     print("$e X $f = ${e * f}");
  //     e++;
  //   }
  //   f = 1;
  // }
}
