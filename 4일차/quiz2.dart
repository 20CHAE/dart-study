// Human 클래스 생성
// 인스턴스 변수생성 : 이름(name), 나이(age), 성별(gender)
// 모든 값들은 클래스 호출시 필수적으로 입력해야 됨
// 생성자 작성시 named parameter를 이용해야 됨 (p.106)
// 이후 사용자의 정보를 출력하는 함수(profile)을 구현하고 다음을 출력하라
// [안녕하세요. 제 이름은 김철수 이며, 16 살 남성 입니다.]

class Human {
  late String name;
  late int age;
  late String gender;

  // // 그냥 생성자 줄여서 쓴다면
  // Human(String givenName, int givenAge, String givenGender)
  //   : name = givenName,
  //     age = givenAge,
  //     gender = givenGender;

  // named paramter 를 이용할 때, 기본 값을 주고 싶지 않다면 -> 이 값이 필수적으로 입력될 것이다 라고 컴퓨터에게 인지를 시켜줘야 함.
  // required 자료형 변수명 이 구조로 사용을 하게 되시면 기본값을 안줘도 필수로 들어갈거다.
  Human({
    required String givenName,
    required int givenAge,
    required String givenGender,
  }) {
    name = givenName;
    age = givenAge;
    gender = givenGender;
  }

  void profile() {
    print("안녕하세요. 제 이름은 $name 이며, $age 살 $gender 입니다.");
  }
}

void main() {
  //일반 생성자 생성시 불러오는 방법
  //값을 적을 때 순서와 자료형을 지켜야한다.
  //  var asdf = Human("kkk", 5, "여성");

  // named parameter 사용할 경우 : 기존 방법으로 선언x
  // (변수명: 값, 변수명: 값, 변수명: 값)
  // 일반 생성자를 썼다면 각 변수의 위치에 값을 넣는다.
  // named parameter는 map처럼 순서 무관
  var human = Human(givenName: "김철수", givenAge: 16, givenGender: "남성");
  // print(human.name);
  // print(human.age);
  // print(human.gender);
  human.profile();
}
