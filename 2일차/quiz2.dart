// 2.키176 몸무게63인 영재의 bmi지수 구하기
// 저체중 ~18.4 정상 18.5~22.9 과체중 23.0~24.9 비만 25.0~
// bmi함수작성 : 체중/키(m)*키(m)

//변수 정의
double height = 1.76;
double weight = 63;
String status = "";

//함수만들기
double bmi(double height, double weight) {
  double myBmi = weight / (height * height);
  return myBmi;
}

//bmi 계산하기
void main() {
  double score = bmi(height, weight);
  if (score <= 18.4) {
    status = "저체중";
  } else if (score <= 22.9) {
    status = "정상";
  } else if (score <= 24.9) {
    status = "과체중";
  } else {
    status = "비만";
  }
  print("영재의 BMI점수는 $score 점이며, 현재 $status 상태입니다.");
}
