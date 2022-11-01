

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mkan_podcast_new/core/constant/ImageUtils.dart';
import 'package:mkan_podcast_new/features/home/routes/routes.dart';

import '../../../core/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2
    ), () {
      Navigator.pushNamed(context, HomeRoute.homePage);
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryGreen,
      body: SafeArea(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: (
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SvgPicture.asset(ImageUtils.splashLogo),


                  Text("Podcast",
                    style: TextStyle(
                      fontSize: 53.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.primaryWhite

                    ),
                  ),
                  Text("BY MKAN",
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.primaryWhite,
                    ),
                  ),
                ],
              )
              ),
            )



          ],
        ),
      ),

    );
  }
}
