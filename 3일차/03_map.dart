// Map 클래스
// key와 value로 구성되어 있다.

void main() {
  //p154 맵생성
  print("Map Creation");
  Map fruit = {"A001": "Apple", "A002": "Mango"};
  print(fruit);

  //비어있는 맵 객체 생성
  //요소타입은 다이나믹
  var empty = <dynamic, dynamic>{};
  print(empty);

  //p155 프로퍼티들 살펴보기
  print("Map Properties");
  print("length ${fruit.length}");
  print("[\"A001\"] ${fruit["A001"]}");
  print("runtimetype ${fruit.runtimeType}");
  print("runtimetype ${empty.runtimeType}");
  print("isNotEmpty ${fruit.isNotEmpty}"); //요소 유무 확인
  print("isNotEmpty ${empty.isNotEmpty}");

  // Map 객체에 요소 add
  print("Map addition");
  fruit["A003"] = "Banana"; //키와 밸류값 설정하고 넣어줌
  print("fruit + new element : $fruit"); //확인
  empty.addAll(fruit); //빈 맵객체에 다른 맵객체 넣기
  print("empty+=fruit $empty"); //확인

  //p156 replace
  print("Map replace");
  fruit["A003"] = "Orange"; //원래있던A003키의 밸류값을 변경함

  // .containsKey()메서드
  // .containsValue()메서드
  // .remove()메서드
  // .clear()메서드

  // ~~연습문제까지
}
