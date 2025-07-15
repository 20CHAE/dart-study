// 6일차 폴더에 quiz5.txt 를 만들고, 해당 파일에 다음 코드 줄을 입력하세요
// 1, 1
// 1, 2
// 1, 3
// 1, 4
// 1, 5
// 1, 6
// 1, 7
// 1, 8
// 1, 9
// 2, 1
// 2, 2
// 2, 3
// 2, 4
// 2, 5
// 2, 6
// 2, 7
// 2, 8
// 2, 9

// 해당 파일을 한 줄씩 내용을 조회하는 함수를 하나 생성하고,
// 각 라인 별 숫자들을 더한 값을 다음과 같이 저장하여 quiz5-answer.txt 로 저장하는 기능을 구현하세요.
// 1 + 1 = 2
// 1 + 2 = 3
// ....
// 2 + 9 = 11

import 'dart:io';
import 'dart:convert';

// 파일을 한줄씩 조회하는 함수 생성
Future<List<String>> readFileToList(String filename) async {
  Stream<String> lines = File(
    filename,
  ).openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    List<String> sList = [];
    await for (var line in lines) {
      sList.add(line);
    }
    return sList;
  } catch (error) {
    throw (error);
  }
}

void main() async {
  // 파일 조각내서 불러오기
  List<String> fileContent = await readFileToList(
    'C:/Users/ASD/Desktop/testapp/dart-study/6일차/quiz5.txt',
  );

  // openWrite : 저장할곳 설정
  var dstSink = File('6일차/quiz5-answer.txt').openWrite();

  // 계산할 변수 생성
  List list = [];
  var a = 0;
  var b = 0;

  // 계산하기
  for (var i in fileContent) {
    list = i.split(",");
    a = int.parse(list[0]);
    b = int.parse(list[1]);
    dstSink.write("$a + $b = ${a + b}\n");
  }

  //종료
  dstSink.close();
}
