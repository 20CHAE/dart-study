// 컴퓨터가랜덤 가위바위보 냄
// 사용자가 한개입력
//  사용자 : 컴퓨터 :
// 가위바위보 승패 출력

// 점수확인
// 먼저3점얻으면 게임종료 출력

import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  // 랜덤메서드
  final random = Random();
  // 가위바위보 리스트
  final options = ["가위", "바위", "보"];

  print("가위바위보 중 하나를 선택하세요");
  var input = stdin.readLineSync(encoding: utf8);
  // 컴퓨터가 0,1,2 중 한개를 랜덤선택
  String computerChoice = options[random.nextInt(3)];
  print("컴퓨터의 선택 : $computerChoice");
  print("나의 선택 : $input");

  // 승패 가리기
  if (true) {}
}
