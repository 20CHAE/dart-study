// 실행결과에 맞는 코드를 짜라
//-----------------------------------------
// 두 수 곱하기 프로그램 - 첫 번째 수 입력: 5
// 두 수 곱하기 프로그램 - 두 번째 수 입력: 6
// 두 수 곱하기 프로그램 - 실행 결과 5 x 6 = 30
// 한 번 더 진행하시겠습니까? 네
// 두 수 곱하기 프로그램 - 첫 번째 수 입력: 7
// 두 수 곱하기 프로그램 - 두 번째 수 입력: 4
// 두 수 곱하기 프로그램 - 실행 결과 7 x 4 = 28
// 한 번 더 진행하시겠습니까? 아니오
// 프로그램을 종료합니다.

import 'dart:convert';
import 'dart:io';

void main() {
  var firstNum, secondNum, againInput;
  bool doAgain = true; // 재실행 묻기

  while (doAgain) {
    stdout.write("두 수 곱하기 프로그램 - 첫 번째 수 입력: ");
    firstNum = stdin.readLineSync();
    firstNum = int.parse(firstNum);
    stdout.write("두 수 곱하기 프로그램 - 두 번째 수 입력: ");
    secondNum = stdin.readLineSync();
    secondNum = int.parse(secondNum);
    stdout.writeln(
      "두 수 곱하기 프로그램 - 실행 결과 $firstNum x $secondNum = ${firstNum * secondNum} ",
    );
    stdout.write("한 번 더 진행하시겠습니까? ");
    againInput = stdin.readLineSync(encoding: utf8);
    if (againInput == "아니오") {
      doAgain = false;
    }
  }
  stdout.write("프로그램을 종료합니다.");
}
