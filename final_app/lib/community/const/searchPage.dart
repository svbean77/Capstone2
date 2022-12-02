import 'dart:convert';

import 'package:final_app/community/const/contents.dart';
import 'package:final_app/community/const/contents_list.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/ip_address.dart';

class SearchPage extends StatefulWidget {
  /*
  boardLst 대신 class 데이터로 받기
   */
  final loginID;
  final boardLst;
  final searchfor;
  final grade;
  final board;
  const SearchPage({
    required this.searchfor,
    required this.boardLst,
    required this.grade,
    required this.loginID,
    required this.board,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(grade: widget.grade),
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.searchfor} 검색 결과', style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 16.0),
            Container(
              height: MediaQuery.of(context).size.height / 15,
              child: Row(
                children: [
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
                        controller: controller,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          hintText: '제목으로 검색',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () {
                      /*
                          select: 제목에 검색어를 포함하는 애들만 불러오기
                          board == free이면 자유게시판, qna이면 질의응답게판에서 검색
                           */
                      List<int> findLst = [];
                      String find = controller.text.toString();

                      findLst = [1, 4, 5];
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => SearchPage(
                            boardLst: findLst,
                            searchfor: find,
                            loginID: widget.loginID,
                            board: widget.board,
                            grade: widget.grade,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                child: widget.boardLst.length == 0
                    ? Container(
                        child: Center(
                          child: Text('게시글이 없습니다.'),
                        ),
                      )
                    : ListView(
                        children: [
                          for (int i = 0; i < widget.boardLst.length; i++)
                            GestureDetector(
                              child: ContentsList(
                                  boardnum: widget.boardLst[i],
                                  grade: widget.grade),
                              onTap: () {
                                /*
                                    위에서 게시글 번호를 통해 클래스 구하고 그 클래스를 그대로 보내면 되겠다
                                     */
                                String title = '게시판 제목';
                                String contents = '게시판 내용${i}';

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Contents(
                                      loginID: widget.loginID,
                                      board: widget.board,
                                      title: title,
                                      contents: contents,
                                      grade: widget.grade,
                                    ),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
