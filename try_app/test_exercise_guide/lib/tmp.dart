/*

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ip_address.dart';

List<String> setExercise(int num, String level, String equipment) {
  //이 모든 것을 각각 리스트로 만들어 넣으면 될 것 같아! List<String> 어쩌구 (return에서 마저 설명)
  //나중에 equipment도 파라미터 사용해야 할 수 있음 일단 이렇게 해두기

  String muscle = "";

  switch (num) {
    case 1:
      break;
    case 2:
      muscle = "가슴";
      break;
    case 3:
      muscle = "대퇴 사두근";
      break;
    case 4:
      muscle = "승모근";
      break;
    case 5:
      muscle = "삼두";
      break;
    case 6:
      muscle = "어깨";
      break;
    case 7:
      muscle = "광배근";
      break;
    case 8:
      muscle = "대퇴 이두근";
      break;
    case 9:
      muscle = "둔근";
      break;
    case 10:
      muscle = "전완근";
      break;
    case 11:
      muscle = "종아리";
      break;
    case 12:
      muscle = "복근";
      break;
    case 13:
      muscle = "등 하부";
      break;
    case 14:
      muscle = "등 중앙부";
      break;
    case 15:
      muscle = "복사근";
      break;
  }

  final jsondata = select(muscle, level, equipment);
  Autogenerated data2 = Autogenerated.fromJson(jsondata);


  //return 형태는 List<List<String>>이 됨!
  return [
    muscleName,
    exerciseName,
    exerciseImage1,
    exerciseImage2,
    equipment,
    level,
    exerciseStep,
    difficulty
  ];
}

List<String> getExerciseLst(String muscle, String level) {
  List<String> lst = [];
  if (level == '초보자') {
    //php 파일명을 같게 하고 폴더로 초보자, 중상급자 나눌까?
  } else {
    //중상급자 if-else 문을 이용해 폴더를 설정하고 밑의 코드에서 php mysql?
  }
  //이 안에서 snapshot 등등 setExercise의 case 안에 들어갈 내용을 묶음
  //muscle은 각 php 파일의 파일명으로 설정하면 될 것 같다
  return lst;
}

Future select(String muscle, String equipment, String difficulty) async {


  var url = Uri.http(IP_ADDRESS, '/test_select.php', {'q': '{http}'});
  var response = await http.post(url, body: <String, String>{
    "muscle": muscle.toString(),
    "equipment": equipment.toString(),
    "difficulty": difficulty.toString(),
  });
  var stringdata = json.decode(json.encode(response.body));
  var jsondata = jsonDecode(stringdata);
  Result data = Result.fromJson(jsondata);

  Autogenerated data2 = Autogenerated.fromJson(jsondata);
  print(data2.runtimeType);
  print(data2.result.runtimeType); //가져온 데이터 전체
  print(data2.result!.length); //가져온 데이터가 몇 개인가?
  print(data2.result![0].muscle); //첫 번째 데이터의 근육

  return jsondata;

}

class Autogenerated {
  List<Result>? result;

  Autogenerated({this.result});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? muscle;
  String? equipment;
  String? difficulty;
  String? exercise;
  String? image1;
  String? image2;
  String? step;

  Result(
      {this.muscle,
        this.equipment,
        this.difficulty,
        this.exercise,
        this.image1,
        this.image2,
        this.step});

  Result.fromJson(Map<String, dynamic> json) {
    muscle = json['muscle'];
    equipment = json['equipment'];
    difficulty = json['difficulty'];
    exercise = json['exercise'];
    image1 = json['image1'];
    image2 = json['image2'];
    step = json['step'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['muscle'] = this.muscle;
    data['equipment'] = this.equipment;
    data['difficulty'] = this.difficulty;
    data['exercise'] = this.exercise;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['step'] = this.step;
    return data;
  }
}


 */