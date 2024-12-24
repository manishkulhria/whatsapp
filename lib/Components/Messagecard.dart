import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/helpers/timedatehelp.dart';
import 'package:whatsapp/model/messagemodel.dart';

// ignore: must_be_immutable
class Messagecard extends StatefulWidget {
  Message message;
  Messagecard({super.key, required this.message});

  @override
  State<Messagecard> createState() => _MessagecardState();
}

class _MessagecardState extends State<Messagecard> {
  @override
  Widget build(BuildContext context) {
    return Apis.user.uid == widget.message.fromid ? greencard() : whiteCard();
  }

  Widget greencard() {
    return Align(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Flexible(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              padding: EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                  color: Appcolors.darkgreen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              child: widget.message.messageType == MessageType.Text
                  ? Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(widget.message.msg!,
                          style: AppTextTheme.fs13Normal()
                              .copyWith(color: Appcolors.white)),
                      Gap(5),
                      Column(children: [
                        Gap(15),
                        Row(children: [
                          Text(
                              Timedateset.timeset(
                                  context: context,
                                  time: widget.message.sentAt!),
                              style: AppTextTheme.fs10Normal()
                                  .copyWith(color: Appcolors.white)),
                          Gap(4),
                          if (widget.message.read!.isNotEmpty)
                            Icon(Icons.done_all,
                                color: Appcolors.blue, size: 15)
                        ]),
                        Gap(3)
                      ])
                    ])
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Stack(alignment: Alignment(0.75, 0.95), children: [
                        FullScreenWidget(
                          disposeLevel: DisposeLevel.Low,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(
                                            color: Appcolors.Red,
                                            value: downloadProgress.progress)),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                imageUrl: widget.message.msg!),
                          ),
                        ),
                        Text(
                            Timedateset.timeset(
                                context: context, time: widget.message.sentAt!),
                            style: AppTextTheme.fs10Normal()
                                .copyWith(color: Appcolors.white)),
                        Gap(4),
                        Positioned(
                            right: 3,
                            child: Icon(Icons.done_all,
                                color: Appcolors.blue, size: 15))
                      ]))))
    ]));
  }

  Widget whiteCard() {
    if (widget.message.read!.isNotEmpty) {
      Apis.Updatereadmsg(widget.message);
    }
    return Row(children: [
      Flexible(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              padding: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                color: Appcolors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                widget.message.messageType == MessageType.Text
                    ? Text(widget.message.msg!,
                        style: AppTextTheme.fs13Normal()
                            .copyWith(color: Appcolors.white))
                    : ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        child: CachedNetworkImage(
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
                            imageUrl: widget.message.msg!)),
                Gap(5),
                Column(children: [
                  Gap(15),
                  Row(children: [
                    Text(
                        Timedateset.timeset(
                            context: context, time: widget.message.sentAt!),
                        style: AppTextTheme.fs10Normal()
                            .copyWith(color: Appcolors.black)),
                    Gap(4)
                  ]),
                  Gap(3)
                ])
              ])))
    ]);
  }
}
