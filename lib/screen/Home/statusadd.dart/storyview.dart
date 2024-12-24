import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              "https://static.vecteezy.com/system/resources/thumbnails/036/226/872/small/ai-generated-nature-landscapes-background-free-photo.jpg",
          imageFit: BoxFit.cover,
          controller: controller)
    ];
    return StoryView(
      storyItems: _itme,
      controller: controller,
      inline: false,
      repeat: true,
      onComplete: () {
        Get.back();
      },
    );
  }
}
