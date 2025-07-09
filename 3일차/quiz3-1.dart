// 1. 1~100 숫자 중 짝수만 list에 담고 출력해라

//리스트 생성
List list = [];

void main() {
  for (int num = 2; num <= 100; num += 2) {
    list.add(num);
  }
  print(list);
}
