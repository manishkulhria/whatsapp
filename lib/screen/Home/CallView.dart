import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/helpers/timedatehelp.dart';
import 'package:whatsapp/model/Callmodel/callcontroller.dart';
import 'package:whatsapp/model/Callmodel/callmodel.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    final _callcontroller = Get.put(Callcontroller());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: Appcolors.darkgreen,
            onPressed: () {
              Get.toNamed(RouteName.Selectcontact);
            },
            child: Icon(Icons.phone, color: Appcolors.white)),
        body: ListView(children: [
          StreamBuilder(
              stream: _callcontroller.Getcallhistory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // 9671510934
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: 42,
                                    width: 42,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            color: Appcolors.Red,
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    imageUrl:
                                        snapshot.data![index].callerimg!)),
                            title: Text(snapshot.data![index].callername!),
                            subtitle: Row(children: [
                              Icon(Icons.call_made_sharp, size: 18),
                              Text(Timedateset.timeset(
                                  context: context,
                                  time: snapshot.data![index].time ?? ""))
                            ]),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                    snapshot.data![index].type ==
                                            "calltype.AUDIO"
                                        ? Icons.call
                                        : Icons.videocam_sharp,
                                    color: Appcolors.darkgreen)));
                      });
                } else {
                  return Center(
                      child: Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator()));
                }
              })
        ]));
  }
}
