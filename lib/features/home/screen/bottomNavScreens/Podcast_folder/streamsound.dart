import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../../core/constant/colors.dart';

class StreamSound extends StatefulWidget {
  const StreamSound({Key? key}) : super(key: key);

  @override
  State<StreamSound> createState() => _StreamSoundState();
}

class _StreamSoundState extends State<StreamSound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: ColorUtils.primaryBlack,
                  ),
                  IconButton(
                      onPressed: (){}, icon: Icon(Icons.favorite_border_outlined, color: ColorUtils.primaryBlack,)),
                ],
              ),
              SizedBox(height: 20.h,),
              Center(
                child: Container(
                  height: 230.h,
                  width: 230.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorUtils.primaryGreen,
                  ),
                ),
              ),



              SizedBox(height: 190.h),

              //SizedBox(height:40.h),

              Padding(
                padding:  EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){}, icon: Icon(Icons.shuffle_rounded), color: ColorUtils.primaryGreen,),

                    IconButton(
                        onPressed: (){}, icon: Icon(Icons.volume_up_sharp), color: ColorUtils.primaryGrey,),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.fast_rewind, size: 50, color: Colors.black,),
                    Icon(Icons.pause, size: 50, color: Colors.black,),

                    Icon(Icons.fast_forward, size: 50, color: Colors.black,),
                  ],
                ),
              ),

              SizedBox(height:30.h),

              Container(
                height: 94.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromRGBO(3, 180, 97, 0.08),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  60.w, vertical:  20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(LineIcons.download, size: 30, color: Colors.black,),
                          Text("Download"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(LineIcons.share, size: 30, color: Colors.black,),
                          Text("Share"),
                        ],
                      ),
                    ],
                  ),
                ),

              ),


            ],
          ),
        ),
      ),
    );
  }
}
