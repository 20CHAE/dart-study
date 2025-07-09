//1. 1~10까지의 리스트를 생성하고 첫번째 인덱스에 9를 넣기
//2. 6번째 인덱스 값 출력
//3. 새로운 리스트 생성하고 "1" "2" "3" 저장, 기존에 존재하는 리스트에 추가한뒤 출력
void main() {
  //1. 리스트 생성
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //첫번째 인덱스에 9넣기
  list.insert(0, 9);
  //출력
  print(list);

  //2. 6번째 인덱스값 출력
  //print(list.indexOf(6));
  print(list[6]);

  //3. 새로운 리스트 생성
  List newList = [];
  print(newList);
  //값넣기
  newList.addAll(["1", "2", "3"]);
  print(newList);
  //기존 리스트에 추가하기
  list.addAll(newList);
  print(list);
}
