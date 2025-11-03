import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/services/localDataHelper.dart';
import 'package:taskati/core/utils/textStyle.dart';
import 'package:taskati/core/widgets/custom_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? path;
  TextEditingController _namecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // تحميل الصورة المحفوظة (لو موجودة)
    path = Localdatahelper.getUserData(Localdatahelper.ImageKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile", style: GetTitleTextStyle(context)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                bool isDarkTheme =
                    Localdatahelper.getUserData(Localdatahelper.isDarkTheme) ??
                    false;
                Localdatahelper.cacheUserData(
                  Localdatahelper.isDarkTheme,
                  !isDarkTheme,
                );
              });
            },
            icon: const Icon(Icons.dark_mode, size: 32),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: path != null
                        ? FileImage(File(path!))
                        : const AssetImage('assets/images/default_avatar.png')
                              as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              height: 200,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  CustomButton(
                                    text: "Upload From Gallery",
                                    onpressed: () {
                                      uploadImage(false);
                                      Navigator.pop(
                                        context,
                                      ); // يقفل الـ bottom sheet
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  CustomButton(
                                    text: "Upload From Camera",
                                    onpressed: () {
                                      uploadImage(true);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Text(
                    Localdatahelper.getUserData(Localdatahelper.NameKey) ??
                        "User",
                    style: GetTitleTextStyle(
                      context,
                    ).copyWith(fontSize: 14, color: Colors.grey),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            width: double.infinity,
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _namecontroller,
                                  decoration: InputDecoration(
                                    hintStyle: GetSmallTextStyle(context)
                                        .copyWith(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                    hintText:
                                        Localdatahelper.getUserData(
                                          Localdatahelper.NameKey,
                                        ) ??
                                        "User",
                                  ),
                                ),
                                Gap(20),
                                CustomButton(
                                  text: "Edit Your Name",
                                  onpressed: () {
                                    if (_namecontroller.text.isNotEmpty) {
                                      Localdatahelper.cacheUserData(
                                        Localdatahelper.NameKey,
                                        _namecontroller.text,
                                      );
                                      setState(() {});
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadImage(bool isCamera) async {
    XFile? pickedImage = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });

      Localdatahelper.cacheUserData(Localdatahelper.ImageKey, path);
    }
  }
}
