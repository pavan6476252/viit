import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viit/view/home.dart';
import 'package:viit/viewmodel/searchHandle/search_handler_model.dart';
import 'package:viit/viewmodel/syllabus_view_model.dart';
import 'package:viit/viewmodel/viit_view_model.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViitViewModel()),
        ChangeNotifierProvider(create: (_) => SyllabusViewModel()),
        ChangeNotifierProvider(create: (_) => SearchHandlerModel())
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
