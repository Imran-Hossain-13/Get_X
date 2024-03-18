import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/screen_one.dart';
import 'getx_controller.dart';
import 'image_picker.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  CounterController myController = Get.put(CounterController());
  ImagePickerController imageController = Get.put(ImagePickerController());
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Obx(() {
            if(imageController.imagePath.toString() == ''){
              return const CircleAvatar(
                backgroundColor: Colors.white38,
                radius: 30,
                child: Icon(Icons.person,size: 40,color: Colors.white,),
              );
            }else{
              return CircleAvatar(
                radius: 30,
                backgroundImage: imageController.imagePath.isNotEmpty?FileImage(File(imageController.imagePath.toString())):null,
                backgroundColor: Colors.deepPurple.withOpacity(.4),
              );
            }
          }),
        ),
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Get X",style: TextStyle(color: Colors.white),),
        ),
        backgroundColor: Colors.purple.shade800,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text("Delete chat"),
              trailing: IconButton(
                onPressed: (){
                  Get.defaultDialog(
                    title: "Are you confirm?",
                    titlePadding: const EdgeInsets.only(top: 20),
                    middleText: "This chat will be delete permanently",
                    contentPadding: const EdgeInsets.all(20),
                    /*content: const Column(
                      children: [
                        Text("Line 1"),
                        Text("Line 2"),
                      ],
                    ),*/
                    confirm: TextButton(
                        onPressed: (){
                          // Navigator.pop(context);
                          Get.back();
                        },
                        child: const Text("Yes")
                    ),
                    cancel: TextButton(
                        onPressed: (){
                          Get.back();},
                        child: const Text("No")
                    ),
                  );
                },
                icon: const Icon(Icons.delete_outlined,size: 35,color: Colors.deepPurple,),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                Get.bottomSheet(
                    Container(
                      decoration: BoxDecoration(
                        color: x==0?Colors.purple.shade50:Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                onTap: (){
                                  Get.changeTheme(ThemeData.light());
                                  setState(() {
                                    x=0;
                                  });
                                  Get.back();
                                },
                                title: const Text("Light Theme"),
                                trailing: const Icon(Icons.light_mode),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: (){
                                  Get.changeTheme(ThemeData.dark());
                                  setState(() {
                                    x=1;
                                  });
                                  Get.back();
                                },
                                title: const Text("Dark Theme"),
                                trailing: const Icon(Icons.dark_mode),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                );
              },
              title: const Text("Change Theme"),
            ),
          ),
          Obx(() {
            return Card(
              child: ListTile(
                title: const Text("Notification"),
                trailing: Switch(
                  value: myController.notification.value,
                  inactiveTrackColor: Colors.white,
                  inactiveThumbColor: Colors.deepPurple,
                  onChanged: (value){
                    myController.changeNotification();
                  },
                ),
              ),
            );
          }),
          Card(
            child: ListTile(
              onTap: (){
                Get.to(const MyImagePicker());
              },
              title: const Text("Select Image"),
              trailing: const Icon(Icons.image_rounded,size: 35,color: Colors.deepPurple,),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: TextButton(
              onPressed: (){
                Get.to(const ScreenOne(name: "Imran",));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple.shade50,
                padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 15)
              ),
              child: const Text("Next Screen"),
            ),
          ),
          const SizedBox(height: 30,),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.red.withOpacity(myController.opacity.value),
                  height: Get.height * .16,
                  width: Get.width * .35,
                ),
                Container(
                  color: Colors.blue.withOpacity(myController.opacity.value),
                  height: Get.height * .16,
                  width: Get.width * .35,
                  margin: EdgeInsets.only(left: 10),
                ),
              ],
            );
          }),
          Obx(() {
            return SizedBox(
              width: 250,
              child: Slider(
                value: myController.opacity.value,
                onChanged: (value){
                  myController.changeOpacity(value);
                }
              ),
            );
          }),
          const SizedBox(height: 10,),
          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: (){
                    Get.updateLocale(const Locale('bn','BD'));
                  },
                  child: const Text("Bangle")
              ),
              TextButton(
                onPressed: (){
                  Get.updateLocale(const Locale('en','US'));
                },
                child: const Text("English")
              ),
              TextButton(
                onPressed: (){
                  Get.updateLocale(const Locale('jp','JP'));
                },
                child: const Text("Japanese")
              ),
            ],
          ),
          Obx((){return Text(myController.counter.toString(),style: const TextStyle(fontSize: 40),);}),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){
                  myController.decrementCounter();
                },
                icon: const Icon(Icons.remove,size: 40,)
              ),
              IconButton(
                onPressed: (){
                  myController.incrementCounter();
                },
                icon: const Icon(Icons.add,size: 40,)
              ),
            ],
          )
          // const MyGrid(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.snackbar(
              "",
              "",
              titleText: const Text("Snackbar",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),),
              messageText: const Text("Hey, How are you?",style: TextStyle(color: Colors.white,fontSize: 15),),
              backgroundColor: Colors.purple.withOpacity(.4),
              snackPosition: SnackPosition.BOTTOM,
              barBlur: 10
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.purple.shade800.withOpacity(.6),
        child: const Icon(Icons.message,color: Colors.white,),
      ),
    );
  }
}

class MyGrid extends StatelessWidget {
  const MyGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          itemCount: 7,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey,
                    offset:const Offset(2,2)
                  )
                ]
              ),
              child: Column(
                children: [
                  Center(child:
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        child: Image.network("https://a.storyblok.com/f/191576/1200x800/2657a50027/add_text_to_photo_after_.webp",fit: BoxFit.fill,)
                    )
                  ),
                  SizedBox(height: Get.height * .02,),
                  const Center(child: Text("Details"),)
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
