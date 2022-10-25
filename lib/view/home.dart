import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viit/view/utils/course_button.dart';
import 'package:viit/viewmodel/viit_view_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ViitViewModel viitViewModel = context.watch<ViitViewModel>();
    return Scaffold(
      appBar: null,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: _ui(viitViewModel),
      ),
    );
  }

  _ui(ViitViewModel viitViewModel) {
    if (viitViewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (viitViewModel.getUserError != null) {
      return Center(
        child: Column(
          children: [
            Text(viitViewModel.getUserError!.userError.toString()),
          const  Text("Check your Internet !!"),
            ElevatedButton(
                onPressed: () async {
                  await viitViewModel.getViitApi();
                },
                child:const  Text("Retry"))
          ],
        ),
      );
    }
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        flex: 1,
        child: Image.network(
          viitViewModel.getViitApiModel!.image,
          width: double.maxFinite,
        ),
      ),
      Expanded(
          flex: 3,
          child: ListView.builder(
              itemCount: viitViewModel.getViitApiModel!.content.length,
              itemBuilder: (context, index) => courseButton(
                  context, viitViewModel.getViitApiModel!.content[index])))
    ]);
  }
}
