// files 폴더 내에 다음의 Map 변수의 key 가 파일명이 되고,
// value 가 각 파일의 내용이 되도록 하는 코드를 구현하세요.
// 각 폴더들은 ./6일차/quiz 폴더에 저장되어야 합니다.
// 각 파일의 확장자는 .txt 입니다.
// ---------------------------------------------------

import 'dart:convert';
import 'dart:io';

void main() {
  var files = {
    "file1": "file1 파일 내용입니다.",
    "file2": "file2 파일 내용입니다.",
    "file3": "file3 파일 내용입니다.",
  };

  // 하나씩 가져와서 키값 밸류값 꺼내고
  for (var i in files.keys) {
    // 파일명 지정하고
    var filename = File('6일차/quiz/$i.txt').openWrite();
    // 내용 넣기
    filename.write(files[i]);
    // 작업 종료
    filename.close();
  }
}
