import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkan_podcast_new/core/constant/colors.dart';

class PodcastScreen extends StatefulWidget {
  final Icon? icon;
  final String? duration;
  final String? title;
  final String? author;
  final String? url;
  final Color? color;
  final Color? colors;
  final int? trackCount;
  final int? id;
  final String ?trackTitle;
  final String ?permalinkUri;
  final String ?artworkUrl;
  final String ?streamUrl;

  //
  // //const PodcastScreen({Key? key}) : super(key: key);
  //
  const PodcastScreen({
      this.icon,
      this.duration,
      this.title,
      this.author,
      this.url,
      this.color,
      this.colors,
      this.trackCount,
      this.id,
    this.trackTitle,
      this.permalinkUri,
      this.artworkUrl,
      this.streamUrl});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  List horizontalArray = [];
  List verticalArray = [];

  String getDuration(int duration) {
    String time;
    int durationTime;

    if (duration < 60000) {
      time = 'Sec';
      durationTime = (duration ~/ 6000);
    } else {
      if (duration >= 60000 && duration < 600000) {
        time = 'Min';
        durationTime = (duration ~/ 60000);
      } else {
        time = 'Hrs';
        durationTime = (duration ~/ 600000);
      }
    }
    return durationTime.toString() + ' ' + time;
  }

  loadRecommendation() async {
    Dio dio = Dio();
    Response response;

    try {
      response = await dio
          .get("https://mkan-media.herokuapp.com/v1/audio/recommendations");
      if (response.data["success"]) {
        List playArray = response.data["data"]["playlists"];
        for (int i = 0; i < playArray.length; i++) {
          log("${playArray[i]}");
          log("${playArray[i]["id"]}");

          setState(() {
            horizontalArray.add(PodcastScreen(
              title: playArray[i]["title"],
              author: playArray[i]["user"]["full_name"],
              duration: getDuration(playArray[i]['duration']),
              color: i.isOdd
                  ? ColorUtils.greenContainer
                  : ColorUtils.amberContainer,
              colors: i.isOdd ? ColorUtils.primaryGreen : ColorUtils.iconAmber,
              //icon: Icon(Icons.play_circle_outline_rounded,),
              trackCount: playArray[i]["track_count"],
              url: playArray[i]["uri"],
              id: playArray[i]["id"],
            ));
          });
        }
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log(e.response.toString());
    }
  }

  loadTracks() async {
    Dio dio = Dio();
    Response response;

    try {
      response = await dio
          .get("https://mkan-media.herokuapp.com/v1/audio/recommendations");
      if (response.data["success"]) {
        List playArray = response.data["data"]["playlists"];
        for (int i = 0; i < playArray.length; i++) {
          setState(() {
            verticalArray.add(PodcastScreen(
              title: playArray[i]["title"],
              author: playArray[i]["user"]["full_name"],
              duration: getDuration(playArray[i]['duration']),
              color:
                  i.isOdd ? ColorUtils.blueContainer : ColorUtils.pinkContainer,
              colors: i.isOdd ? ColorUtils.iconBlue : ColorUtils.iconPink,
              //icon: Icon(Icons.play_circle_outline_rounded,),
              trackCount: playArray[i]["track_count"],
              url: playArray[i]["uri"],
              id: playArray[i]["id"],
            ));
          });
        }
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log(e.response.toString());
    }
  }

  Widget containerStyle(
      {required icon,
      required duration,
      required title,
      required author,
      required url,
      required color,
      required colors,
      required trackCount,
      required id}) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, "/second");
          },
          child: Container(
            width: 295.w,
            height: 179.h,
            // color: containercolor,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(author),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: colors,
                      ),
                      Padding(padding: EdgeInsets.only(left: 20.w)),
                      Text(
                        duration.toString(),
                        style: TextStyle(
                          color: colors,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
  }

  Widget squareStyle(
      {required icon,
      required duration,
      required title,
      required author,
      required url,
      required color,
      required colors,
      required trackCount,
      required id}) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/third");
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: Column(
                    children: [
                      Icon(
                        icon,
                        color: colors,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        duration.toString(),
                        style: TextStyle(
                          color: colors,
                        ),
                      ),
                    ],
                  ),
                ),
                height: 90.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title.toString(),
                ),
                Text(author.toString()),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 10.w),
              child: Text(
                "Podcast",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "SourceSansPro",
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 15.h, bottom: 20.h, left: 15.w, right: 15.w),
                child: CupertinoTextField(
                  cursorColor: ColorUtils.cusorGreen,
                  prefix: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.search,
                      color: ColorUtils.searchGreen,
                    ),
                  ),
                  suffix: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.mic,
                      color: ColorUtils.searchGreen,
                    ),
                  ),
                  placeholder: "All podcast",
                  style: const TextStyle(
                    color: ColorUtils.searchGreen,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorUtils.cusorGreen,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 170.h,
              child: Padding(
                padding: EdgeInsets.only(left: 15.h),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: horizontalArray
                      .map(
                        (pod) => containerStyle(
                            icon: pod.icon,
                            duration: pod.duration,
                            title: pod.title,
                            author: pod.author,
                            url: pod.url,
                            color: pod.color,
                            colors: pod.colors,
                            trackCount: pod.trackCount,
                            id: pod.id),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 350.h,
              child: Padding(
                padding: EdgeInsets.only(left: 15.h),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: verticalArray
                      .map(
                        (trc) => squareStyle(
                            icon: trc.icon,
                            duration: trc.duration,
                            title: trc.title,
                            author: trc.author,
                            url: trc.url,
                            color: trc.color,
                            colors: trc.colors,
                            trackCount: trc.trackCount,
                            id: trc.id),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadRecommendation();
    loadTracks();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
