import 'package:final_app/community/const/contents.dart';
import 'package:final_app/community/const/contents_list.dart';
import 'package:final_app/community/const/searchPage.dart';
import 'package:final_app/community/write_board.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class FreeBoard extends StatefulWidget {
  final loginID;
  const FreeBoard({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  State<FreeBoard> createState() => _FreeBoardState();
}

class _FreeBoardState extends State<FreeBoard> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*
      select: 사용자의 테마 선택 가져오기
       */
    /*
      select: 자유게시판 게시글들 불러오기
      (게시글번호, 제목, 작성자, 작성일자, 내용, 사진주소를 리스트로 변경)
       */
    List<int> boardLst = [1, 3, 4, 5, 6];
    int grade = 5;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: PRIMARY_COLOR[grade],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => WriteBoard(
                board: 'free',
                mode: 'write',
                content: "",
                loginID: widget.loginID,
                title: "",
              ),
            ),
          );
        },
        child: Icon(Icons.create,
            color: (grade == 0 ||
                    grade == 1 ||
                    grade == 2 ||
                    grade == 4 ||
                    grade == 8)
                ? Colors.black
                : Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 15,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grade == 0
                              ? Colors.grey.withOpacity(0.2)
                              : PRIMARY_COLOR[grade],
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
                      select: 자유게시판 목록에서 제목에 검색어를 포함하는 게시글만 불러오기
                      (json으로 보내기)
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
                            board: 'free',
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
                child: boardLst.length == 0
                    ? Container(
                        child: Center(
                          child: Text('게시글이 없습니다.'),
                        ),
                      )
                    : ListView(
                        children: [
                          for (int i = 0; i < boardLst.length; i++)
                            GestureDetector(
                              child: ContentsList(
                                  boardnum: boardLst[i], grade: grade),
                              onTap: () {
                                /*
                                위에서 구한 json에서 각 내용들을 클래스로 매핑하는걸 여기서 해도 되나?
                                여기는 이미 for문 내부라서 안될 것 같은데
                                각각의 내용을 보냄!!
                                ex) result.title[i]
                                contents에게 제목, 내용, 작성자, 작성일자, 조회수, 사진이름, 사진경로 다 보내야 함!
                                */
                                String title = '게시판 제목';
                                String contents = '게시판 내용${i}';

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Contents(
                                        loginID: widget.loginID,
                                        board: 'free',
                                        title: title,
                                        contents: contents),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}