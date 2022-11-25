/*
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ip_address.dart';

Future setExercise(
    int num, String muscle, String equipment, String difficulty) async {
  if (num == 16) return;
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

  var url;
  if (difficulty == "초보자")
    url = Uri.http(IP_ADDRESS, '/test_select.php', {'q': '{http}'});
  else
    url = Uri.http(IP_ADDRESS, '/test_select.php', {'q': '{http}'});
  var response = await http.post(url, body: <String, String>{
    "muscle": muscle.toString(),
    "equipment": equipment.toString(),
    "difficulty": difficulty.toString(),
  });
  var stringdata = json.decode(json.encode(response.body));
  var jsondata = jsonDecode(stringdata);

  Autogenerated data2 = Autogenerated.fromJson(jsondata);
  print(data2.runtimeType);
  print(data2.result.runtimeType); //가져온 데이터 전체
  print(data2.result!.length); //가져온 데이터가 몇 개인가?
  print(data2.result![0].muscle); //첫 번째 데이터의 근육

  List<String> muscleName = [];
  List<String> exerciseName = [];
  List<String> exerciseImage1 = [];
  List<String> exerciseImage2 = [];
  List<String> exerciseStep = [];

  for (int i = 0; i < data2.result!.length; i++) {
    muscleName.add(data2.result![i].muscle!);
    exerciseName.add(data2.result![i].exercise!);
    exerciseImage1.add(data2.result![i].image1!);
    exerciseImage2.add(data2.result![i].image2!);
    exerciseStep.add(data2.result![i].step!);
  }

  return [
    muscleName,
    exerciseName,
    exerciseImage1,
    exerciseImage2,
    equipment,
    exerciseStep,
    difficulty
  ];
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