// 다음 코드에서 빠진 부분을 채워,
// './6일차/quiz/temp.txt' 파일에 'Dart는 재미있어요!' 라는 문자열을 저장한 후,
// 그 내용을 다시 읽어 출력하는 프로그램을 완성하세요.

import 'dart:io';

void main() async {
  // txt파일을 객체로 만듦
  var file = File('6일차/quiz/temp.txt');

  // 파일에 문자열 저장 (빈칸을 채우세요)
  var sink = file.openWrite();
  sink.write("Dart는 재미있어요!444");
  await sink.close();

  // 저장한 내용을 다시 읽기 (빈칸을 채우세요)
  String content = await file.readAsString();

  print(content);
}
