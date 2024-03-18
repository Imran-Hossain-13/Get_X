import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_controller.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key,});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  CounterController myController = Get.put(CounterController());
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
      body: Column(
        children: [
          Flexible(child: SizedBox(
            height: Get.height *.5,
            child: ListView.builder(
              itemCount: myController.favoriteCountry.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(myController.favoriteCountry[index]),
                    trailing: const Icon(Icons.favorite,color:Colors.red),
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
