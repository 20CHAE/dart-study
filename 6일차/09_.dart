// p296 파일 읽기 (불러오기)

import 'dart:io';
import 'dart:convert';

// (1) -----------------------------------------
// Future<String> readFileToString(String filename) async {
//   var file = File(filename);
//   // file.readAsString() -> 한번에 파일을 통으로 가져와서 읽음
//   //용량이작거나 내용이적다면 빠르게 가져올 수 있음
//   //단, 용량 크거나 내용 많다면 파일 읽을 때 시간소요됨

//   String fileContent = await file.readAsString();
//   return fileContent;
// }

// (2)----------------------------------------------
// Stream 하나의 파일을 조각내서 필요한 부분만 이용.
// 수도꼭지로 필요한 만큼 물양을 조절하듯이 잘라낸다.
Future<List<String>> readFileToList(String filename) async {
  Stream<String> lines =
      File(filename) //File 객체 만들기
          .openRead() //읽을 파일 열기
          .transform(utf8.decoder) // utf8 유니코드로 변경할게
          .transform(LineSplitter()); // lineSplitter : 한줄씩 잘라줌

  try {
    List<String> sList = []; // sList 만들어서
    await for (var line in lines) {
      sList.add(line); // 각 줄들을 sList에 담겠다.
    }
    return sList;
  } catch (error) {
    throw (error);
  }
}

void main() async {
  // (1) --------------------------
  // var result = await readFileToString(
  //   "C:/Users/ASD/Desktop/testapp/dart-study/6일차/09_src.txt",
  // );
  // print(result);

  // (2) -----------------------------
  // try {
  //   List<String> fileContent = await readFileToList('6일차/09_src.txt');
  //   for (var fileLine in fileContent) {
  //     print(fileLine);
  //   }
  // } catch (error) {
  //   print(error);
  // }

  // p302~ 파일에 데이터 저장하기------------------------------

  List<String> fileContent = await readFileToList('6일차/09_src.txt');

  var sList = [];
  var iVar1 = 0;
  var iVar2 = 0;
  var count = 0;

  var dstSink = File('6일차/dst.txt').openWrite();

  dstSink.write(':=> File ACCESSED ${DateTime.now()}\n');
  for (var fileLine in fileContent) {
    sList = fileLine.split(',');
    iVar1 = int.parse(sList[0]);
    iVar2 = int.parse(sList[1]);
    print("$iVar1 x $iVar2 = ${iVar1 * iVar2}");
    dstSink.write("$iVar1 x $iVar2 = ${iVar1 * iVar2}\n");
    count++;
  }
  dstSink.write(':=> $count items calulated');

  // p.304 작업종료
  // 종료를 하지 않으면 저장이 안될 수도 있다.
  dstSink.close();
}
