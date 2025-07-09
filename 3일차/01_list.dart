void main() {
  //리스트 생성
  //
  //꺽쇠를 써서 타입을 지정할 수 있다.
  //꺽쇠 안쓰면 기본값은 dynamic이다.
  //List<int> list = [1, 2, 3, 4, 5];
  //
  List list = [1, 2, 3, 4, 5];

  print(list.first); //첫번째 출력
  print(list.last); //마지막 출력
  print(list.indexOf(1)); //1은 몇번째 순서인지
  //
  //해당인덱스에 값을 넣는다. 기존값은 삭제
  list.insert(0, 6);
  print(list);
  //
  //add 마지막에 값을 추가한다.
  list.add(8);
  print(list);
  //
  //addAll 받은 리스트를 뒤에 추가한다.
  //list형태로 [] 넣어야 함!
  list.addAll([10, 11, 12]);
  print(list);
  //
  //sort 정렬하기
  list.sort();
  print("sort $list");
  //
  //clear 리스트 내용 전부삭제
  list.clear();
  print("clear $list");

  //----------------------------------
  //
  //
  //반복문 안에서 리스트 사용
  List ex = [1, 2, 3, 4, 5];
  for (var item in ex) {
    print(item);
  }
  //in을 사용하지 않는다면 : index 갯수를 정확히 알아야 오류가 안남
  //따라서 in을 쓰는게 효율적이다.
  for (int i = 1; i <= 4; i++) {
    print(ex[i]);
  }

  // 연습문제 풀기!
}
