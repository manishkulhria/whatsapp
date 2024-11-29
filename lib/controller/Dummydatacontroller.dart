import 'package:flutter/material.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/icon_image.dart';

class DataController {
  static List<Map<String, dynamic>> Chatdata = [
    {
      "image": AppImage.aron,
      "title": "Aron",
      "subtitle": "Lorem ipsum dolor sit",
      "time": "10 minutes ago",
      "call": Icons.call_made_sharp,
      "callcolor": Appcolors.darkgreen,
      "trallingicon": Icons.videocam_sharp
    },
    {
      "image": AppImage.abelson,
      "title": "Abelson",
      "subtitle": "Curabitur finibus dictum nisl, ac sagitt...",
      "time": "Today, 7:29 am",
      "call": Icons.call_made_sharp,
      "callcolor": Appcolors.darkgreen,
      "trallingicon": Icons.call
    },
    {
      "image": AppImage.franklin,
      "title": "Franklin",
      "subtitle": "Photo",
      "time": "Today, 7:29 am",
      "call": Icons.call_received_sharp,
      "callcolor": Appcolors.Red,
      "trallingicon": Icons.videocam
    },
    {
      "image": AppImage.lilly,
      "title": "Lilly",
      "subtitle": "Document.pdf (1 page)",
      "time": "26, June, 10:54 pm",
      "call": Icons.call_made_sharp,
      "callcolor": Appcolors.darkgreen,
      "trallingicon": Icons.call
    },
    {
      "image": AppImage.jacobjones,
      "title": "Jacob Jones",
      "subtitle": "Morbi viverra urna sit amet nunc",
      "time": "Today, 7:29 am",
      "call": Icons.call_received_sharp,
      "callcolor": Appcolors.Red,
      "trallingicon": Icons.call
    },
    {
      "image": AppImage.abelson,
      "title": "Abelson",
      "subtitle": "👍🏻👍🏻",
      "time": "Yesterday, 11:11 pm",
      "call": Icons.call_made_sharp,
      "callcolor": Appcolors.darkgreen,
      "trallingicon": Icons.videocam_sharp
    },
    {
      "image": AppImage.cathor,
      "title": "Cathor",
      "subtitle": "Morbi rhoncus nunc sit amet felis blandit co....",
      "time": "Yesterday, 11:11 pm",
      "call": Icons.call_received_sharp,
      "callcolor": Appcolors.Red,
      "trallingicon": Icons.call
    },
    {
      "image": AppImage.henryward,
      "title": "Henry Ward",
      "subtitle": "💜",
      "time": "Yesterday, 11:11 pm",
      "call": Icons.call_received_sharp,
      "callcolor": Appcolors.Red,
      "trallingicon": Icons.call
    },
  ];

  // ------------------------ Profileview data ---------------------------

  static List<Map<String, dynamic>> Profiledata = [
    {
      "icon": Icons.key,
      "title": "Account",
      "subtitle": "Privacy, security, change number",
    },
    {
      "icon": Icons.chat,
      "title": "Chats",
      "subtitle": "Theme, wallpapers, chat history"
    },
    {
      "icon": Icons.notifications,
      "title": "Notifications",
      "subtitle": "Message, group & call tones "
    },
    {
      "icon": Icons.data_saver_off_rounded,
      "title": "Storage and data",
      "subtitle": "Network usage, auto-download"
    },
    {
      "icon": Icons.help_outline_outlined,
      "title": "Help",
      "subtitle": "Help centre, contact us, privacy policy"
    },
    {"icon": Icons.people, "title": "Invite a friend", "subtitle": ""},
  ];
  // ---------------------AccountView data----------------------
  static List<Map<String, dynamic>> Accountdata = [
    {"icon": Icons.lock, "title": "Privacy"},
    {"icon": Icons.security, "title": "Security"},
    {"icon": Icons.verified, "title": "Two-step verification"},
    {"icon": Icons.logout, "title": "Change number"},
    {"icon": Icons.insert_drive_file, "title": "Request account info"},
    {"icon": Icons.delete, "title": "Delete my account"},
  ];
  // ------------All contact---------------------
  static List<Map<String, dynamic>> Allcontacts = [
    {
      "image": AppImage.num,
      "title": "+91 9876543210",
      "subtitle": "",
    },
    {
      "image": AppImage.Abroma,
      "title": "Abramo",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur",
    },
    {
      "image": AppImage.Addyson,
      "title": "Addyson",
      "subtitle": "Morbi rhoncus nunc sit amet felis blandit ",
    },
    {
      "image": AppImage.Alcandor,
      "title": "Alcandor",
      "subtitle": "Morbi viverra urna sit amet nunc viverra, pellentes...",
    },
    {
      "image": AppImage.Aleene,
      "title": "Aleene",
      "subtitle": "Curabitur finibus dictum nisl, ac sagittis ",
    },
    {
      "image": AppImage.Ammiel,
      "title": "Ammiel",
      "subtitle": "Morbi viverra urna sit amet nunc viverra, pellentes...",
    },
    {
      "image": AppImage.Amory,
      "title": "Amory",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur",
    },
    {
      "image": AppImage.franklin,
      "title": "Franklin",
      "subtitle": "Curabitur finibus dictum nisl, ac sagittis ",
    },
    {
      "image": AppImage.lilly,
      "title": "Lilly",
      "subtitle": "Nullam at felis non dolor consequat sodales. Nulla ",
    },
    {
      "image": AppImage.henryward,
      "title": "Henry Ward",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur",
    },
    {
      "image": AppImage.cathor,
      "title": "Cathor",
      "subtitle": "Morbi rhoncus nunc sit amet felis blandit ",
    },
    {
      "image": AppImage.abelson,
      "title": "Abelson",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur",
    },
  ];
}
