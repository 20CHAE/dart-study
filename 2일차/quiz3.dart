//3. 사용자의 이름, 전화번호, 나이를 입력받아 출력하는 함수
// 나이는 필수입력아님 미입력시 "비공개"로 표기
//[제 이름은 $name , 전화번호는 $phone 이며, 제 나이는 $age 입니다.]

//함수만들기
void join({required String name, required int phone, dynamic age = "비공개"}) {
  print("제 이름은 $name , 전화번호는 $phone 이며, 제 나이는 $age 입니다.");
}

//함수실행

void main() {
  join(name: "newbie", phone: 1234);
}
