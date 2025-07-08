void main () {
  //4. 비엔날레 관람권 성인5천원 아동3천원
  // 가족은 15,000원 내고 거스름돈과 영수증 받음
  
  //인원 수
  int adult = 2;
  int child = 1;

  //가격
  int adult_price = 5000;
  int child_price = 3000;
  
  //인원*가격
  int adult_totall_price = adult * adult_price;
  int child_totall_price = child * child_price;
  
  //낸돈, 받을 돈
  int insert_money = 15000;
  int change_money = insert_money - adult_totall_price - child_totall_price;
  
  //영수증 내용 직접 출력해보기
  // 성인 (2명) : $adult_totall_price 원
  // 아동 (1명) : $child_totall_price 원

  print("-----비엔날레 영수증-----");
  print("총 $insert_money 원 받았습니다.");
  print("-----------------------");
  print("성인 \(2명\) \: $adult_totall_price 원");
  print("아동 \(1명\) \: $child_totall_price 원");
  print("-----------------------");
  print("거스름 돈 \: $change_money 원");



}