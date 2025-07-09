// 4.주희 영수 369게임
// 1~40의 숫자 중 3이 포함되면 "짝" 출력
// 그외 숫자출력
// for문과 while문으로 작성하라

//dart-core/string/contains 참조
//https://api.dart.dev/dart-core/String/contains.html

//스트링으로 변환하고
//그중에 문자3이 있다면 짝 출력한다
//없다면 숫자 출력한다

void main() {
  //for문
  for (int num = 1; num <= 40; num++) {
    //스트링으로 변환
    String k = num.toString();
    // 출력확인하기
    // print("$k ${k.contains('3')}");
    // 문자3이 들어있으면 짝을 출력
    if (k.contains('3')) {
      print("짝");
    } else {
      print(num);
    }
  }

  //while문
  int i = 1;
  while (i <= 40) {
    //스트링으로 변환
    String k = i.toString();
    if (k.contains('3')) {
      print("짝");
    } else {
      print(i);
    }

    i++;
  }
}
