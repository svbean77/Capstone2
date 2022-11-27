import 'package:final_app/mypage/my_page.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

import '../screen/const/grade_colors.dart';

class EditMyInfo extends StatefulWidget {
  final loginID;
  final grade;
  const EditMyInfo({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<EditMyInfo> createState() => _EditMyInfoState();
}

class _EditMyInfoState extends State<EditMyInfo> {
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _userageController = TextEditingController();

  bool isPasswordVisible = false;
  List<bool> sex = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      appBar: MyAppBar(grade: widget.grade),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '내 정보 수정',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('아이디', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Text(widget.loginID),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('비밀번호', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.grade == 0
                                ? Colors.grey.withOpacity(0.2)
                                : PRIMARY_COLOR[widget.grade],
                          ),
                        ),
                        child: TextField(
                          controller: _pwController,
                          obscureText: isPasswordVisible ? false : true,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: widget.grade == 0
                                      ? Colors.grey
                                      : PRIMARY_COLOR[widget.grade],
                                ),
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('닉네임', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.grade == 0
                                ? Colors.grey.withOpacity(0.2)
                                : PRIMARY_COLOR[widget.grade],
                          ),
                        ),
                        child: TextField(
                          controller: _nicknameController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('나이', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.grade == 0
                                ? Colors.grey.withOpacity(0.2)
                                : PRIMARY_COLOR[widget.grade],
                          ),
                        ),
                        child: TextField(
                          controller: _userageController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('성별', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ToggleButtons(
                        children: [
                          Text('남자'),
                          Text('여자'),
                        ],
                        isSelected: sex,
                        selectedColor: Colors.black,
                        fillColor: (widget.grade == 0 || widget.grade == 7)
                            ? Colors.black.withOpacity(0.1)
                            : PRIMARY_COLOR[widget.grade].withOpacity(0.3),
                        onPressed: (value) {
                          setState(() {
                            if (value == 0) {
                              sex[0] = true;
                              sex[1] = false;
                            } else {
                              sex[0] = false;
                              sex[1] = true;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    /*
                    update: 사용자 정보 수정
                     */
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyPage(
                            loginID: widget.loginID, grade: widget.grade),
                      ),
                    );
                  },
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PRIMARY_COLOR[widget.grade],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '저장',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
