import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/helpers/timedatehelp.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/model/messagemodel.dart';
import 'package:whatsapp/screen/Home/MessageView.dart';

// ignore: must_be_immutable
class Usertile extends StatelessWidget {
  Usermodel user;

  Usertile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    Message? _message;
    return StreamBuilder(
        stream: Apis.getlastmessage(user),
        builder: (context, snapshot) {
          final data = snapshot.data?.docs;
          final _list = data
                  ?.map((e) =>
                      Message.fromjson(FirebaseResponseModel.fromResponse(e)))
                  .toList() ??
              [];
          if (_list.isNotEmpty) {
            _message = _list[0];
          }

          return ListTile(
            onTap: () {
              Get.to(MessageView(model: user));
            },
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                color: Appcolors.Red,
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageUrl: user.image.toString())),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(user.name.toString(), style: AppTextTheme.fs13Normal()),
                ]),
            subtitle: Text(
                (_message != null
                        ? _message!.messageType == MessageType.Image
                            ? "image"
                            : _message!.msg
                        : user.about)
                    .toString(),
                style:
                    AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            trailing: _message == null
                ? null
                : _message!.read!.isEmpty && _message!.fromid != Apis.user.uid
                    ? Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Appcolors.darkgreen))
                    : Text(
                        Timedateset.getlasttime(
                            context: context, time: _message!.sentAt!),
                        style: AppTextTheme.fs12Normal()
                            .copyWith(color: Appcolors.Lightgreen)),
          );
        });
  }
}
