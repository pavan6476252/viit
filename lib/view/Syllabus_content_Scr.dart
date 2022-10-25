import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viit/view/utils/course_button.dart';

import '../viewmodel/searchHandle/search_handler_model.dart';
import '../viewmodel/syllabus_view_model.dart';

class SyllabusContentSrc extends StatelessWidget {
  String url;
  SyllabusContentSrc(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    SyllabusViewModel syllabusContnet = context.watch<SyllabusViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text(syllabusContnet.getSyllabusApiModel!.title)),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: _ui(syllabusContnet, context),
      ),
    );
  }

  _ui(SyllabusViewModel syllabusContnet, BuildContext context) {
    if (syllabusContnet.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (syllabusContnet.getUserError != null) {
      return Center(
        child: Column(
          children: [
            Text(syllabusContnet.getUserError!.userError.toString()),
            const Text("Check your Internet !!"),
            ElevatedButton(
                onPressed: () async {
                  await syllabusContnet.getSyllabusApi(url);
                },
                child: const Text("Retry"))
          ],
        ),
      );
    }
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          onChanged: (value) {
            context.read<SearchHandlerModel>().setSearchTerm(value);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a search term',
          ),
        ),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: syllabusContnet.getSyllabusApiModel!.content.length,
              itemBuilder: (_, index) {
                if (context.watch<SearchHandlerModel>().getSearchTerm == "") {
                  return courseButton3(syllabusContnet
                      .getSyllabusApiModel!.content
                      .elementAt(index));
                } else {
                  return syllabusContnet.getSyllabusApiModel!.content
                          .elementAt(index)
                          .title
                          .toLowerCase()
                          .contains(
                              context.watch<SearchHandlerModel>().getSearchTerm)
                      ? courseButton3(syllabusContnet
                          .getSyllabusApiModel!.content
                          .elementAt(index))
                      : const SizedBox();
                }
              }))
    ]);
  }
}
