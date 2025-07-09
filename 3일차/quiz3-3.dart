// 3.name과 age를 입력받을 수 있는 Player class 만들고
// 해당 플레이어의 이름, 나이를 확인할 수 있는 getter 함수 작성
// 해당 내역을 수정할 수 있는 setter 함수 작성

//클래스 생성
class Player {
  //인스턴스변수 생성
  late String name;
  late int age;

  //생성자
  Player(givenName, givenAge) {
    name = givenName;
    age = givenAge;
  }

  //getter함수 작성
  String get getName => "$name";
  int get getAge => age;

  //setter함수 작성
  set setName(String givenName) => name = givenName;
  set setAge(int givenAge) => age = givenAge;
}

void main() {
  //함수 실행
  dynamic n = Player("KKK", 1);
  // print(n.name); 출력확인
  // print(n.age);

  //getter
  print(n.getName);
  print(n.getAge);

  //setter
  n.setName = "PPP";
  print(n.getName);
  n.setAge = 5;
  print(n.getAge);
}
