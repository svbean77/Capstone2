import 'package:final_app/friends/friends_main.dart';
import 'package:final_app/ranking/const/user_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  /*
  class로 넘겼다고 가정
   */
  final loginID;
  final nickname;
  final rating;
  final grade;

  const RequestCard({
    required this.loginID,
    required this.grade,
    required this.nickname,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(
            color: PRIMARY_COLOR[grade],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('asset/images/ranking/$rating.png'),
                Text(' $nickname', style: TextStyle(fontSize: 20.0)),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.person_search),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UserInfo(
                            loginID: loginID,
                            nickname: nickname,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    child: Icon(Icons.add_circle_outline),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 100.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('친구추가 하시겠습니까?'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          '취소',
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
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          /*
                                          insert: 친구 추가하는 코드
                                           */
                                          /*
                                          delete: 친구요청 삭제하는 코드
                                           */
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        FriendsMain(
                                                            loginID: loginID,
                                                            grade: grade)),
                                          );
                                        },
                                        child: Text(
                                          '확인',
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
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    child: Icon(Icons.cancel_outlined),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 100.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('요청삭제 하시겠습니까?'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          '취소',
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
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          /*
                                          delete: 친구요청 삭제하는 코드
                                           */
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        FriendsMain(
                                                            loginID: loginID,
                                                            grade: grade)),
                                          );
                                        },
                                        child: Text(
                                          '확인',
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
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}