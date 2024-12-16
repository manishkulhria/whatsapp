import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:whatsapp/constants/Appcolors.dart';

class Storyview extends StatelessWidget {
  const Storyview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    List<StoryItem> _itme = [
      StoryItem.text(title: "hlo sonu", backgroundColor: Appcolors.Red),
      StoryItem.pageImage(
          url:
              "https://www.google.com/imgres?q=image&imgurl=https%3A%2F%2Fimg-cdn.pixlr.com%2Fimage-generator%2Fhistory%2F65bb506dcb310754719cf81f%2Fede935de-1138-4f66-8ed7-44bd16efc709%2Fmedium.webp&imgrefurl=https%3A%2F%2Fpixlr.com%2Fimage-generator%2F&docid=6dhDHhJGcmvL6M&tbnid=B_ypq20yGKrazM&vet=12ahUKEwjr5s_OxZyKAxWLUGwGHVayGFwQM3oECDcQAA..i&w=500&h=500&hcb=2&itg=1&ved=2ahUKEwjr5s_OxZyKAxWLUGwGHVayGFwQM3oECDcQAA",
          controller: controller)
    ];
    return StoryView(storyItems: _itme, controller: controller,inline: false,repeat: true,);
  }
}
