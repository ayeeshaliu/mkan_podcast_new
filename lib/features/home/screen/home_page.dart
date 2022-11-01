


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottomNavScreens/Podcast_folder/Podcast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController pageController = PageController();

  int currentIndex = 0;

  List<Widget> getScreens(){
    return [
      PodcastScreen(),
      Container(child: Text("Hello2")),
      Container(child: Text("Hello3")),
      Container(child: Text("Hello4")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: getScreens()),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (v) {
          setState(() {
            currentIndex = v;
            pageController.jumpToPage(
              currentIndex,
            );
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.podcasts,
                size: 25,
              ),
              label: "Podcast"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.videocam_sharp,
                size: 25,
              ),
              label: "Videos"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 25,
              ),
              label: "Saved"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
              label: "Settings"),

        ],

      ),


    );
  }
}
