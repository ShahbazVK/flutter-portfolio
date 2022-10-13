// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shahbaz Portfolio",
      theme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.deepPurple,
        // primarySwatch: Color.fromARGB(206, 0, 0, 0),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shahbaz Ali"),
        ),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroSection(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "   --Projects",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ProjectSection(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "   --Skills",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SkillSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 600),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "../images/hero.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            // width: MediaQuery.of(context).size.width,
          ),
          Text(
            "I am Shahbaz Ali.\n I write code for mobile apps and web.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width > 768 ? 40 : 30,
              color: Colors.white,
              backgroundColor: Color.fromARGB(255, 51, 41, 90),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectSection extends StatelessWidget {
  ProjectSection({Key? key}) : super(key: key);
  final List<Map> projects = [
    {
      "title": "ABC clone",
      "url": "https://tradingview.com",
      "image":
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/cryptocurrency_explained.jpg",
    },
    {
      "title": "ABC clone",
      "url": "https://tradingview.com",
      "image":
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/cryptocurrency_explained.jpg",
    },
    {
      "title": "ABC clone",
      "url": "https://tradingview.com",
      "image":
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/cryptocurrency_explained.jpg",
    },
    {
      "title": "ABC clone",
      "url": "https://tradingview.com",
      "image":
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/cryptocurrency_explained.jpg",
    },
    {
      "title": "ABC clone",
      "url": "https://tradingview.com",
      "image":
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/cryptocurrency_explained.jpg",
    },
    {
      "title": "DEF clone",
      "url": "https://tradingview.com",
      "image":
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/cryptocurrency_explained.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: projects
          .map(
            (e) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Color.fromARGB(206, 0, 0, 0),
                child: GridTile(
                  header: GridTileBar(
                    title: Text(
                      "${e["title"]}",
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Image.network(
                    e["image"],
                  ),
                  footer: GridTileBar(
                    title: TextButton(
                      onPressed: () {
                        window.open(e["url"], "code link");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "View code",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.code),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class GenerateStars extends StatelessWidget {
  final int star;
  final String skillname;
  const GenerateStars({Key? key, required this.star, required this.skillname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [
      Container(
        width: 100,
        child: Text(
          skillname,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ];
    for (var i = 0; i < star; i++) {
      stars.add(
        Icon(
          Icons.star,
          // color: Theme.of(context).primaryColor,
        ),
      );
    }
    for (var i = star; i < 10; i++) {
      stars.add(
        Icon(
          Icons.star_border_outlined,
          // color: Theme.of(context).primaryColor,
        ),
      );
    }
    return Row(
      children: stars,
    );
  }
}

class SkillSection extends StatelessWidget {
  const SkillSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            GenerateStars(star: 8, skillname: "React"),
            SizedBox(height: 10),
            GenerateStars(star: 8, skillname: "MERN"),
            SizedBox(height: 10),
            GenerateStars(star: 6, skillname: "Flutter"),
            SizedBox(height: 10),
            GenerateStars(star: 9, skillname: "OOP Concepts"),
            SizedBox(height: 10),
            GenerateStars(star: 9, skillname: "HTML/CSS/JS"),
          ],
        ),
        if (MediaQuery.of(context).size.width > 946)
          Image.asset("../images/webdev.png")
      ],
    );
  }
}
