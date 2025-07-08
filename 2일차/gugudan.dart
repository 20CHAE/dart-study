void main() {
  //구구단 1단계 만들기

  var dan = 1;
  var number = 1;

  for (number = 1; number < 10; number++) {
    print("$dan X $number = ${dan * number}");
  }

  //구구단 9단계 만들기
  for (dan = 1; dan < 10; dan++) {
    for (number = 1; number < 10; number++) {
      print("$dan X $number = ${dan * number}");
    }
  }
}
