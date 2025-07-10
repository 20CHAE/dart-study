// 3.name과 age를 입력받을 수 있는 Player class 만들고
// 해당 플레이어의 이름, 나이를 확인할 수 있는 getter 함수 작성
// 해당 내역을 수정할 수 있는 setter 함수 작성

//클래스 생성
class Player {
  //인스턴스변수 생성
  late String name;
  late int age;

  //생성자
  //나이만 대괄호를 써서 선택사항으로 만들었음
  //대괄호 없으면 모두 필수사항임
  Player(String givenName, [int givenAge = 0]) {
    name = givenName;
    age = givenAge;
  }

  //get 메서드 작성
  String returnName() {
    return name;
  }

  int returnAge() {
    return age;
  }

  //set 메서드 작성
  void setName(String givenName) {
    name = givenName;
  }

  void setAge(int givenAge) {
    age = givenAge;
  }

  //getter함수 작성
  String get getterName => name;
  int get getterAge => age;

  //setter함수 작성
  set setterName(String givenName) => name = givenName;
  set setterAge(int givenAge) => age = givenAge;
}

void main() {
  //함수 실행
  var n = Player("KKK", 1);
  // print(n.name); 출력확인
  // print(n.age);

  //get
  print("get으로 리턴 ${n.returnName()}");
  print("get으로 리턴 ${n.returnAge()}");

  //set
  n.setName("JJJ");
  print(n.returnName());
  n.setAge(10);
  print(n.returnAge());

  //getter
  print(n.getterName);
  print(n.getterAge);

  //setter
  n.setterName = "PPP";
  print(n.getterName);
  n.setterAge = 5;
  print(n.getterAge);
}
