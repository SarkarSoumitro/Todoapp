

import 'package:flutter/material.dart';
import 'package:todoapp/pages/home_page.dart';

void main()async{

  runApp(const Myapp());
}

class Myapp extends StatelessWidget{
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      //theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
   
}