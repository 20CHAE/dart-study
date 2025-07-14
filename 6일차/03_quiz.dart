// [안녕하세요. 출력하실 내용을 입력해주세요:] 를 먼저 출력하고
// 사용자의 입력창
// 사용자가 [그만] 이라는 문자열을 입력하기 전까지는 계속 반복됨
// [그만] 입력시 [프로그램 종료] 출력.

import 'dart:convert'; //인코딩을 하니까 자동으로 붙은 패키지.
import 'dart:io';

void main() {
  stdout.write("안녕하세요. 출력하실 내용을 입력해주세요:");
  var word = stdin.readLineSync(encoding: utf8);
  while (word != "그만") {
    stdout.write("출력하실 내용을 입력해주세요:");
    word = stdin.readLineSync(encoding: utf8);
  }
  stdout.writeln("------프로그램 종료------");
}
