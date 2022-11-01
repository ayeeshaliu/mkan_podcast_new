import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkan_podcast_new/features/home/screen/bottomNavScreens/Podcast_folder/streamsound.dart';

import 'core/navigation/routes.dart';
import 'core/theme/material_theme.dart';
import 'features/home/screen/bottomNavScreens/Podcast_folder/albumPage.dart';

 Future <void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child)  {
          return Theme(
            data: materialTheme,
            child: PlatformProvider(
              settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
              builder: (context) => PlatformApp(
                localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                  DefaultMaterialLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                ],

                title: 'Podcast',
                initialRoute: "/",
                routes: {
                  "/second" : (context) =>  AlbumPage(),
                  "/third" : (context) => StreamSound(),
                },
                onGenerateRoute: (settings) =>
                    RouteGenerator.generateRoute(settings),
                material: (_, __) => MaterialAppData(
                  debugShowCheckedModeBanner: false,
                  theme: materialTheme,
                ),
                cupertino: (_, __) => CupertinoAppData(
                  debugShowCheckedModeBanner: false,
                  theme: const CupertinoThemeData(
                    primaryColor: Color(0xff127EFB),
                  ),
                ),
              ),
            ),
          );
        });
  }
}


