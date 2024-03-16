import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatefulWidget {
  final String name;
  const ScreenOne({super.key, this.name = ''});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Mr.${widget.name}",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){Get.back();},
          icon: const Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,),
        ),
        backgroundColor: Colors.purple.shade800,
      ),
      body:
      Center(
        child: TextButton(
          onPressed: (){
            Get.toNamed('/ScreenTwo',arguments: ["Imran","asd"]);
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.purple.shade50,
              padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 15)
          ),
          child: const Text("Next Screen"),
        ),
      ),
    );
  }
}
