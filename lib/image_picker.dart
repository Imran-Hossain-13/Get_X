import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_x/getx_controller.dart';
import 'package:get/get.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  ImagePickerController imageController = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: imageController.imagePath.isNotEmpty?FileImage(File(imageController.imagePath.toString())):null,
                backgroundColor: Colors.deepPurple.withOpacity(.4),
              ),
            ),
            TextButton(
              onPressed: (){
                imageController.getImage();
              },
              child: const Text("Select Image")
            )
          ],
        );
      }),
    );
  }
}
