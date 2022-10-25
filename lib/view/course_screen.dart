import 'package:flutter/material.dart';
import 'package:viit/model/viit_main_model.dart';
import 'package:viit/view/utils/course_button.dart';

class CourseScreen extends StatelessWidget {
  ViitApiModelContent content;
  CourseScreen(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(content.title)),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: content.content.length,
            itemBuilder: (context, index) =>
                courseButton2(context, content.content.elementAt(index)),
          )),
        ],
      ),
    );
  }
}
