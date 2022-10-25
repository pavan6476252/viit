import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viit/view/Syllabus_content_Scr.dart';
import 'package:viit/view/course_screen.dart';

import '../../model/viit_main_model.dart';
import '../syllabus_view_model.dart';

navigateCourseScreen(BuildContext context, ViitApiModelContent content)async {
 await  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CourseScreen(content)));
}

navigateSyllabusScr(BuildContext context, String url) async {
  await context.read<SyllabusViewModel>().getSyllabusApi(url);
   Navigator.push(context,
      MaterialPageRoute(builder: (context) => SyllabusContentSrc(url)));
}
