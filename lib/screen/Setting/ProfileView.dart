import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/authcontroller.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  late final UserController _userController;
  // ignore: unused_field
  late final TextEditingController _phonenoController;
  late final TextEditingController _nameController;

  File? imageFile;
  @override
  void initState() {
    super.initState();
    try {
      _userController = Get.find<UserController>();
    } catch (e) {
      print('UserController is not initialized: $e');
      Get.put(UserController());
      _userController = Get.find<UserController>();
    }

    _nameController =
        TextEditingController(text: _userController.user.name ?? '');
    _phonenoController =
        TextEditingController(text: _userController.user.phoneno ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final _controlelr = Get.find<UserController>();
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Appcolors.white,
          backgroundColor: Appcolors.darkgreen,
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Gap(10),
          Center(
              child: Stack(alignment: Alignment(0.9, 1), children: [
            Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: imageFile == null
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        color: Appcolors.Red,
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            imageUrl: _controlelr.user.image.toString())
                        : Image.file(
                            imageFile!,
                            width: 150,
                            fit: BoxFit.cover,
                          ))),
            IconButton(
                style:
                    TextButton.styleFrom(backgroundColor: Appcolors.darkgreen),
                onPressed: () async {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => imagePickerbottomsheet());
                  await Apis.Updateuser(_nameController.text.trim(), imageFile);
                  Get.back();
                },
                icon: Icon(Icons.camera_alt, color: Appcolors.white, size: 20))
          ])),
          Gap(40),
          ListTile(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Enter your name",
                                  style: AppTextTheme.fs16Bold()),
                              Gap(10),
                              TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                      fillColor: Appcolors.darkgreen,
                                      suffix:
                                          Icon(Icons.emoji_emotions_outlined))),
                              Gap(10),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {},
                                        child: Text("Cancel",
                                            style: AppTextTheme.fs16Bold()
                                                .copyWith(
                                                    color:
                                                        Appcolors.darkgreen))),
                                    Gap(20),
                                    GestureDetector(
                                        onTap: () async {
                                          await Apis.Updateuser(
                                              _nameController.text.trim(),
                                              _controlelr.user.image as File?);
                                          Get.back();
                                        },
                                        child: Text("Save",
                                            style: AppTextTheme.fs16Bold()
                                                .copyWith(
                                                    color:
                                                        Appcolors.darkgreen)))
                                  ])
                            ])));
              },
              leading: Icon(Icons.person, color: Appcolors.grey),
              title: Text("Name", style: AppTextTheme.fs11Normal()),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_controlelr.user.name.toString(),
                        style: AppTextTheme.fs13semibold()),
                    Text(
                        "This is not your username or pin. This name will be visible to your whatsApp contacts.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.fs11Normal())
                  ]),
              trailing: Icon(Icons.edit, color: Appcolors.darkgreen)),
          Divider(),
          ListTile(
              leading: Icon(Icons.remove_circle_outline, color: Appcolors.grey),
              title: Text("About", style: AppTextTheme.fs11Normal()),
              subtitle: Text("Hey there! I am using whatsApp.",
                  style: AppTextTheme.fs13semibold()),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Appcolors.darkgreen))),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone, color: Appcolors.grey),
            title: Text("Phone", style: AppTextTheme.fs11Normal()),
            subtitle: Text(_controlelr.user.phoneno.toString(),
                style: AppTextTheme.fs13semibold()),
          ),
          TextButton(
              onPressed: () async {
                await Apis.Updateuser(_nameController.text.trim(), imageFile);
                Get.back();
                Get.snackbar('Success', 'Update successfully');
              },
              child: Text("save"))
        ])));
  }

  getImageFormGallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Navigator.of(context).pop();
    }
  }

  getImageFormCamra() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Navigator.of(context).pop();
    }
  }

  imagePickerbottomsheet() {
    return ClipRect(
        child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            width: MediaQuery.of(context).size.width,
            height: 220,
            child: Column(children: [
              Gap(15.h),
              Text("Image Picker", style: AppTextTheme.fs16Bold()),
              Gap(10.h),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      getImageFormCamra();
                    });
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Appcolors.darkgreen,
                  ),
                  label: Text("Camera",
                      style: AppTextTheme.fs13semibold()
                          .copyWith(color: Appcolors.darkgreen))),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      getImageFormGallery();
                    });
                  },
                  icon: Icon(Icons.image, color: Appcolors.darkgreen),
                  label: Text("Gallery",
                      style: AppTextTheme.fs13semibold()
                          .copyWith(color: Appcolors.darkgreen))),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel, color: Appcolors.darkgreen),
                  label: Text("Cancel",
                      style: AppTextTheme.fs13semibold()
                          .copyWith(color: Appcolors.darkgreen)))
            ])));
  }
}
