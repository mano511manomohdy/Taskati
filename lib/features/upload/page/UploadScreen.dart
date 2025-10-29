import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/extenstions/Navigator.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/textStyle.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/HomeScree.dart/page/HomeScreen.dart';
import 'package:taskati/features/upload/widgets/ShowDialog.dart';

class Uploadscreen extends StatefulWidget {
  const Uploadscreen({super.key});

  @override
  State<Uploadscreen> createState() => _UploadscreenState();
}

class _UploadscreenState extends State<Uploadscreen> {
  String? path;
  final TextEditingController _namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text(
              "Done",
              style: GetBodyTextStyle(color: AppColors.primaryColor),
            ),
            onPressed: () {
              if (path != null && _namecontroller.text.isNotEmpty) {
                context.PushReplacement(Homescreen());
              } else if (path == null && _namecontroller.text.isNotEmpty) {
                ShowDialogToast(
                  context: context,
                  text: "please upload an image",
                );
              } else if (path != null && _namecontroller.text.isEmpty) {
                ShowDialogToast(
                  context: context,
                  text: "please Enter your name",
                );
              } else if (path == null && _namecontroller.text.isEmpty) {
                ShowDialogToast(
                  context: context,
                  text: "please Enter your name and upload an image",
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.greyColor,
                backgroundImage: path != null ? FileImage(File(path!)) : null,
              ),
              SizedBox(height: 20),
              CustomButton(
                size: Size(300, 40),
                text: "Upload From Gallery",
                onpressed: () {
                  uploadImage(false);
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                size: Size(300, 40),
                text: "Upload From Camera",
                onpressed: () {
                  uploadImage(true);
                },
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  hintStyle: GetSmallTextStyle(),
                  hintText: "Enter your name",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadImage(bool isCamera) async {
    XFile? pickedimage = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedimage != null) {
      setState(() {
        path = pickedimage.path;
      });
    }
  }
}
