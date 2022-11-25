import 'package:flutter/material.dart';
import 'package:test_exercise_guide/screen/select_muscle.dart';

import '../const/equipment_filter.dart';
import '../const/exercise_card.dart';
import 'home_screen.dart';

class ExerciseGuide extends StatefulWidget {
  final level;
  final jsondata;
  final muscle;
  const ExerciseGuide({
    required this.level,
    required this.jsondata,
    required this.muscle,
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseGuide> createState() => _ExerciseGuideState();
}

class _ExerciseGuideState extends State<ExerciseGuide> {
  @override
  Widget build(BuildContext context) {
    Autogenerated data = Autogenerated.fromJson(widget.jsondata);

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            },
            child: Icon(Icons.home),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8.0),
          FloatingActionButton(
            elevation: 0,
            heroTag: 'filter',
            child: Icon(Icons.filter_list_alt),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return SizedBox();
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.level} ${widget.muscle} 운동 가이드\n> ${data.result![0].equipment}',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        SelectMuscle(level: widget.level),
                  ),
                );
              },
              child: Text('근육 선택'),
            ),
            SizedBox(height: 16.0),
            if (data.result!.length == 0)
              Center(
                child: Text('운동이 없습니다.'),
              )
            else
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 0; i < data.result!.length; i++)
                      ExerciseCard(
                          exerciseStep: data.result![i].step!,
                          exerciseName: data.result![i].exercise!,
                          exerciseImage1: data.result![i].image1!,
                          difficulty: data.result![i].difficulty!,
                          exerciseImage2: data.result![i].image2!,
                          equipment: data.result![i].equipment!,
                          muscleName: data.result![i].muscle!),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
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
