// p.289

import 'dart:convert';
import 'dart:io';

void main() {
  // 입력 이라는 글자를 출력해줘
  stdout.write("입력해주세요");
  // 사용자의 입력값을 userInput에 담아줘
  var userInput = stdin.readLineSync(encoding: utf8);
  stdout.writeln("당신은 이것을 입력했습니다. : $userInput");
  stdout.writeln("당신의 문자 타입은 : ${userInput.runtimeType}");

  // exit 라는 단어를 적을 때까지 반복됨
  while (userInput != "exit") {
    stdout.write("입력해주세요");
    userInput = stdin.readLineSync(encoding: utf8);
    stdout.writeln("당신은 이것을 입력했습니다. : $userInput");
    stdout.writeln("당신의 문자 타입은 : ${userInput.runtimeType}");
  }
  stdout.writeln("종료");
}
