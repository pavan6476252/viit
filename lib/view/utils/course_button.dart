
import 'package:flutter/material.dart';
import 'package:viit/model/viit_main_model.dart';
import 'package:viit/viewmodel/navigation/navigation_handler.dart';
import 'package:viit/viewmodel/url_launcher/launch_my_url.dart';

import '../../model/syllabus_content_model.dart';

courseButton(BuildContext context, ViitApiModelContent content) {
  return GestureDetector(
    onTap: ()async {
     await navigateCourseScreen(context, content);
    },
    child: Card(
      child: SizedBox(
        height: 80,
        width: double.maxFinite,
        child: Center(
          child: Text(content.title),
        ),
      ),
    ),
  );
}

courseButton2(
  BuildContext context,
  ContentContent content,
) {
  return GestureDetector(
    onTap: () async {
      await navigateSyllabusScr(context, content.link);
    },
    child: Card(
      child: SizedBox(
        height: 80,
        width: double.maxFinite,
        child: Center(
          child: Text(content.title),
        ),
      ),
    ),
  );
}

courseButton3(Content content) {
  return GestureDetector(
    onTap: () async {
      await launchMyUrl(content.link);
    },
    child: Card(
      child: SizedBox(
        height: 80,
        width: double.maxFinite,
        child: Center(
          child: Text(content.title),
        ),
      ),
    ),
  );
}
