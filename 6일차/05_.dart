// p.291
// 값을 한번에 2개 받아서 계산하기

import 'dart:io';

void main() {
  var iList = <int>[];
  var sList = <String>[];
  stdout.write("숫자 입력 : ");
  var input = stdin.readLineSync();
  sList = input!.split(',');
  var index = 0;
  for (var item in sList) {
    iList.add(int.parse(item));
    //아래 교재대로 쓰면 오류남
    //iList[index] = int.parse(sList[index]);
    index++;
  }

  // 화면 출력시, string + string은 문자열끼리 나란히 출력됨 (3 + 3 = 33)
  // int + int = 두수 더한값 출력됨
  stdout.writeln("결과 : ${iList[0]} + ${iList[1]} = ${iList[0] + iList[1]}");
}
