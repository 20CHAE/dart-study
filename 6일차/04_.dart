// p.290
//값을 두번 받아서 더한값 출력

import 'dart:io';

void main() {
  // int형만 들어가는 리스트 생성
  var iList = <int>[];
  stdout.write("첫번째 숫자 입력 : ");
  var input = stdin.readLineSync();

  //리스트에 입력값을 넣어줘.
  // int.parse(값) : 값을 인트형으로 변경
  // ! 없이 input만적는다면 오류생김 : 사용자가 입력을 안했을때, null이 됨. int.parse()는 null을 받을 수 없어서 오류남
  // null이 될일 없고 언제나 값을 입력할거라는 뜻으로 느낌표를 붙임.
  iList.add(int.parse(input!));
  stdout.write("두번째 숫자 입력 : ");
  input = stdin.readLineSync(); //string으로 받게됨
  // A ?? B  : A가 참이면 A사용 거짓이면 B사용
  // input ?? '1' : input에 값이 있으면 그걸 사용하고, 없으면 '1'을 써라
  // 근데 교재 코드는 오류나서 아래처럼 수정하였다.
  iList.add(int.parse((input?.isEmpty ?? true) ? '0' : input!));
  stdout.writeln("결과 : ${iList[0]} + ${iList[1]} = ${iList[0] + iList[1]}");
}
