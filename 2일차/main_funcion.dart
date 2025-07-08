//
//
//
//
//함수 만들기
// 형식 : '반환할함수의자료형' '함수명' () {       return 0;}
int getget(int num1, int num2) {
  return 0; //값을 반환해야함
}

// 반환값이 없는 함수
void hello() {
  print("hello");
}

//p105
int getMax(var num3, var num4) {
  if (num3 >= num4) {
    return num3;
  } else {
    return num4;
  }
}

// void main() {
//   var numnum = getMax(1, 2);
//   print(numnum);
// }

//예시 : 플레이어 생성
// required : 변수를 꼭 받을 수 있게 설정함. null값이 올 수 없음
void creatPlayer({required String name, int level = 1, double exp = 0.00}) {
  print('Player $name is $level level and $exp exp.');
}

//플레이서 생성하기
void main() {
  creatPlayer(name: 'LEE', level: 2, exp: 0.00);
}
