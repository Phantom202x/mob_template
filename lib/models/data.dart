import 'package:flutter/material.dart';

List<MyImage> images = [
  MyImage(id: 0, url: "assets/images/Final-Banner.png"),
  MyImage(id: 1, url: "assets/images/Krodja1.png"),
  MyImage(id: 2, url: "assets/images/Soltani1.png"),
  MyImage(id: 3, url: "assets/images/Krodja2.png"),
  MyImage(id: 4, url: "assets/images/Soltani2.png"),
  MyImage(id: 5, url: "assets/images/Final-Banner2.png"),
  MyImage(id: 6, url: "assets/images/Krodja3.png"),
  MyImage(id: 7, url: "assets/images/Soltani3.png"),
  MyImage(id: 8, url: "assets/images/myBG.png"),
  MyImage(id: 9, url: "assets/images/MyBG01.png"),
  MyImage(id: 10, url: "assets/images/MyBG02.png"),
  MyImage(id: 11, url: "assets/images/FinalBG.png"),
  MyImage(id: 12, url: "assets/images/FinalBG02.png"),
];

List<MyText> texts = [
  MyText(
      heading: "What is Lorem Ipsum?",
      imageUrl: "assets/images/Soltani2.png",
      content:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  MyText(
      heading: "Why do we use it?",
      content:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
  MyText(
      heading: "Where does it come from?",
      content:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32."),
  MyText(
      heading: "Where can I get some?",
      imageUrl: "assets/images/Krodja2.png",
      content:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."),
  MyText(
      heading: "The standard Lorem Ipsum passage, used since the 1500s",
      content:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
];

class MyImage {
  final int id;
  final String url;
  String title, subTitle;

  MyImage(
      {required this.id,
      required this.url,
      this.title = "",
      this.subTitle = ""});
}

class MyText {
  final String heading, content;
  final String? imageUrl;
  final Widget? addSomething;

  MyText({
    required this.heading,
    required this.content,
    this.imageUrl,
    this.addSomething,
  });
}
