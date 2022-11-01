import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mkan_podcast_new/features/home/screen/bottomNavScreens/Podcast_folder/Podcast.dart';

import '../../../../../core/constant/colors.dart';

class AlbumPage extends StatefulWidget {

  final Icon ?icon;
  final String ?duration;
  final String title;
  final String author;
  final String ?url;
  final Color ?color;
  final Color ?colors;
  final int ?trackCount;
  final int ?id;
  final String ?trackTitle;
  final String ?permalinkUri;
  final String ?artworkUrl;
  final String ?streamUrl;



  const AlbumPage ({ this.icon,  this.duration,  this.title="",  this.author="",  this.url,  this.color,  this.trackCount,   this.id,  this.colors,  this.trackTitle,  this.permalinkUri,   this.artworkUrl,   this.streamUrl,});
  //const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {

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


  loadTracks() async {
    Dio dio = Dio();
    Response response;
    try {
      final uri = "https://mkan-media.herokuapp.com/v1/audio/tracks?playlistId=${widget.id}" ;
      log(uri);
      response = await dio
          .get(uri);
       log("${response.data}");
      if (response.data['success']) {
        List recommendArray = response.data["data"];
        for (int i = 0; i < recommendArray.length; i++) {
          setState(() {
            // titleArray.add(recommendArray[i]['title']);
            // durationArray.add(recommendArray[i]['duration']);
            // nameArray.add(recommendArray[i]["user"]['full_name']);
            // urlArray.add(recommendArray[i]['uri']);
            // countArray.add(recommendArray[i]['track_count']);
            verticalArray.add(PodcastScreen(
              title: recommendArray[i]["title"],
              author: recommendArray[i]["user"]["full_name"],
              duration: getDuration(recommendArray[i]['duration']),
              color: i.isOdd
                  ? Color.fromRGBO(170, 247, 214, 1)
                  : Color.fromRGBO(252, 217, 255, 1),
              icon: Icon(Icons.play_circle_outline_rounded),
              colors: i.isOdd
                  ? Color.fromRGBO(2, 209, 112, 1)
                  : Color.fromRGBO(238, 51, 255, 1),
              url: recommendArray[i]['uri'],
              id: recommendArray[i]["id"],
              trackTitle: recommendArray[i]["title"],
              permalinkUri: recommendArray[i]["permalink_url"],
              artworkUrl: recommendArray[i]["artwork_url"],
              streamUrl: recommendArray[i]["stream_url"],
            ),
            );
          });
        }

      }
    } on DioError catch (e) {
      log(e.message.toString());
      log(e.response.toString());
    }
  }

  Widget squareStyle(
      {required icon ,
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
            Container(
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
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){Navigator.pop(context);
                      },
                    icon: Icon(Icons.arrow_back), color: ColorUtils.primaryBlack,),
                Icon(LineIcons.horizontalEllipsis, color: ColorUtils.primaryBlack,),
              ],
        ),
            SizedBox(height: 25.h,),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w
                  ),
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: ColorUtils.primaryGreen,
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.title),
                    Text(widget.author),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(LineIcons.soundcloud, color: ColorUtils.primaryGreen,size: 30,)),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding:  EdgeInsets.only(left: 5.w),
                      child: Text("${widget.trackCount.toString()} Episodes"),
                    ),
                  ],
                ),

                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined, color: ColorUtils.primaryGreen,size: 30,)),
                    SizedBox(height: 5.h,),
                    Text("Shares"),
                  ],
                ),

                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined, color: ColorUtils.primaryGreen,size: 30,)),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding:  EdgeInsets.only(right: 5.w),
                      child: Text("Favourites"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Episodes", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),),

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
          ],
        ),
      )),
    );
  }
  @override
  void initState() {
    super.initState();
    loadTracks();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
