import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key,});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Mr.${Get.arguments[0]}",style: const TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){Get.back();},
          icon: const Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,),
        ),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Center(
        child: Text("Hello2"),
      ),
    );
  }
}
