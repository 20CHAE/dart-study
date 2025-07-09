//Quiz

void main() {
  // 1.철수 시험점수 70점
  // 철수의 등급을 if else로 출력해라
  // 91-100:A 81-90:B 71-80:C 61-70:D 51-60:E 나머지:F
  // 점수 = score, 등급 = grade

  int score = 70;
  String grade = ""; //비워두는 것이 더 좋을 듯

  if (score >= 91 && score < 101) {
    // 101부터는 지정을 안해서 오류생길 수 있음
    grade = "A";
  } else if (81 <= score && score < 91) {
    grade = "B";
  } else if (71 <= score && score < 81) {
    grade = "C";
  } else if (61 <= score && score < 71) {
    grade = "D";
  } else {
    grade = "F";
  }
  print("철수의 시험점수는 $score 이며, 등급은 $grade 입니다.");
}
