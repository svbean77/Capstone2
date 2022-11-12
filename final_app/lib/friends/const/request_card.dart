import 'package:final_app/ranking/const/user_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final nickname;
  final rating;

  const RequestCard({
    required this.nickname,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int grade = 0;

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
                            nickname: nickname,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    child: Icon(Icons.add_circle_outline),
                    onTap: (){
                      //db에 친구 추가하는 코드
                    },
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    child: Icon(Icons.cancel_outlined),
                    onTap: (){
                      //친구 요청 목록에서 삭제하는 코드
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