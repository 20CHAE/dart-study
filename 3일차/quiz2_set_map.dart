void main() {
  //1. 문자열 "가" ~ "사" 를 포함한 set를 생성
  //"라" ~ "하" 를 포함한 set 생성
  //두세트를 합친 새로운 세트를 변수에 담아 출력
  Set set1 = {"가", "나", "다", "라", "마", "바", "사"};
  Set set2 = {"라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"};

  // set1.addAll(set2); 이렇게 해도 됨
  Set set3 = set1.union(set2);
  print(set3);

  // 1.(심화) 교집합 합집합 차집합을 새로운 세트로 출력해보기
  //교집합
  Set set4 = set1.intersection(set2);
  print("교집합 $set4");
  //차집합 set1 - set2
  Set set5 = set1.difference(set2);
  print("차집합 $set5");

  // 2. 과일 상점 변수 shop 으로 map 생성
  // apple 10개, banana 5개, mango 3개
  // 이 상점에서는 망고를 $count 개 판매하고 있습니다. 출력하기
  Map shop = {"apple": 10, "banana": 5, "mango": 3};
  int count = 0;

  // 여기에 망고가 있는지 확인하기
  if (shop.containsKey("mango")) {
    count = shop["mango"];
    print("이 상점에서는 망고를 $count 개 판매하고 있습니다.");
  }
  // 내가 푼 방법
  // int count = shop["mango"];
  // print("이 상점에서는 망고를 $count 개 판매하고 있습니다.");

  // 2.(심화) 상점에서 망고를 2개 판매했다.
  // 과일상점에서 현재 팔고 있는 망고의 총개수는?

  //망고 2개 뺸다
  shop["mango"] -= 2;
  // 내가 푼 방법
  //shop["mango"] = 1;

  print("망고의 총 개수는 ${shop["mango"]}개 입니다.");
}
