void main() {
  //set (집합)
  //set과 list의 차이점
  //중괄호 사용 {}
  //중복된 값을 담을 수 없음
  //순서가 없음

  //----------------------
  //교과서 깃허브를 참고하여 작성하였음

  //세트 클래스객체 생성
  Set setFill = {1, 2};
  Set setEmpty = {};

  //출력확인하기
  print("setFill $setFill"); // {1, 2}
  print("setEmpty $setEmpty"); // {}

  //add
  setFill.add(3);
  print("add $setFill");
  setEmpty.addAll([3, 4, 5]);
  print("addAll $setEmpty");

  //contains사용
  print("3 in setFill? : ${setFill.contains(3)}");
  print("5 in setFill? : ${setFill.contains(5)}");

  // union 합집합
  print("Union of setFill and setEmpty : ${setFill.union(setEmpty)}");

  // intersection 교집합
  print("교집합 ${setFill.intersection(setEmpty)}");

  // difference 차집합
  print("차집합 ${setFill.difference(setEmpty)}");

  //remove제거
  setFill.remove(3); //3을 제거해라
  print("3을 제거 $setFill");

  //
  //
  // p143 하단부터 이어서 하기

  //연습문제까지~~
}
