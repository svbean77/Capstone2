import 'package:final_app/exercise/const/equipment_filter.dart';
import 'package:final_app/exercise/select_muscle.dart';
import 'package:final_app/record/const/add_record.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/db_class.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';
import '../screen/const/grade_colors.dart';
import 'const/exercise_card.dart';

class ExerciseGuide extends StatefulWidget {
  final loginID;
  final level;
  final muscle;
  final equipment;
  final jsondata;

  const ExerciseGuide({
    required this.loginID,
    required this.level,
    required this.muscle,
    required this.equipment,
    required this.jsondata,
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseGuide> createState() => _ExerciseGuideState();
}

class _ExerciseGuideState extends State<ExerciseGuide> {
  @override
  Widget build(BuildContext context) {
    /*
    select: 사용자 선택 테마
     */
    int grade = 0;
    if (widget.loginID != "") grade = 5;

    EXERCISE_GUIDE data = EXERCISE_GUIDE.fromJson(widget.jsondata);
    int cnt = data.result!.length;

    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID),
      appBar: MyAppBar(grade: grade),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            elevation: 0,
            heroTag: 'memo',
            child: Icon(Icons.edit_calendar,
                color: (grade == 0 ||
                        grade == 1 ||
                        grade == 2 ||
                        grade == 4 ||
                        grade == 8)
                    ? Colors.black
                    : Colors.white),
            onPressed: () {
              if (widget.loginID == '')
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        height: 100.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('로그인 후 사용 가능합니다'),
                            SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('확인',
                                  style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey[200], elevation: 0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              else
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: AddRecord(
                          grade: grade,
                          selectedDate: DateTime.now(),
                          loginID: widget.loginID),
                      scrollable: true,
                    );
                  },
                );
            },
            backgroundColor: PRIMARY_COLOR[grade],
          ),
          SizedBox(height: 8.0),
          FloatingActionButton(
            elevation: 0,
            heroTag: 'filter',
            child: Icon(Icons.filter_list_alt,
                color: (grade == 0 ||
                        grade == 1 ||
                        grade == 2 ||
                        grade == 4 ||
                        grade == 8)
                    ? Colors.black
                    : Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return EquipmentFilter(
                      level: widget.level,
                      loginID: widget.loginID,
                      muscle: widget.muscle);
                },
              );
            },
            backgroundColor: PRIMARY_COLOR[grade],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.level} ${widget.muscle} 운동 가이드\n> ${widget.equipment}',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR[grade],
                elevation: 0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SelectMuscle(
                        loginID: widget.loginID, level: widget.level),
                  ),
                );
              },
              child: Text(
                '근육 선택',
                style: TextStyle(
                  color: (grade == 0 ||
                          grade == 1 ||
                          grade == 2 ||
                          grade == 4 ||
                          grade == 8)
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            if (cnt == 0)
              Expanded(
                child: Center(
                  child: Text('운동이 없습니다.'),
                ),
              )
            else
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 0; i < cnt; i++)
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