import 'dart:convert';

import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/ip_address.dart';

class AddRecord extends StatelessWidget {
  final loginID;
  final grade;
  final selectedDate;
  const AddRecord({
    required this.loginID,
    required this.grade,
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String year = selectedDate.year.toString();
    String month = selectedDate.month.toString();
    if (month.length == 1) month = "0" + month;
    String day = selectedDate.day.toString();
    if (day.length == 1) day = "0" + day;

    return Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                border: InputBorder.none,
                hintText: '$year.$month.$day 기록 추가',
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: MyText(text: "취소", grade: grade),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                  elevation: 0,
                ),
                onPressed: () async {
                  String date = year + month + day;
                  print(date);
                  if (controller.text.toString() != "") {
                    var url = Uri.http(IP_ADDRESS,
                        '/test_add_exercise_record.php', {'q': '{http}'});
                    var response = await http.post(url, body: <String, String>{
                      "nickname": loginID.toString(),
                      "writeDate": date.toString(),
                      "comment": controller.text.toString(),
                    });
                    var jsondata =json.decode(json.encode(response.body));

                    if (jsondata.toString() == "Success") Navigator.of(context).pop();
                  }
                },
                child: MyText(text: "확인", grade: grade),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
