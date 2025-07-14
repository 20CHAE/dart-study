// p285

//다트에서 제공헤주는 사용자입출력기능 패키지를 가져오기
// io : input & output
import 'dart:convert';
import 'dart:io';

// stdout, stdin 불러와서 쓰는거야
// stdout (standard output) : 다트의 표준화된 화면출력 기능
// stdin (standard input) : 다트의 키보드 입력 지원

void main() {
  // 입력 이라는 글자를 출력해줘
  stdout.write("입력");
  // 사용자의 입력값을 userInput에 담아줘
  var userInput = stdin.readLineSync(encoding: utf8);
  // 아래 문구를 출력해줘
  stdout.writeln("당신은 이것을 입력했습니다. : $userInput");

  //writeln과 write의 차이점 -----------------------
  //writeln : 문장 실행 후 줄을 바꿔줌
  //write : 줄바꿈 없이 그대로 출력됨
}
