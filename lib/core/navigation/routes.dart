

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkan_podcast_new/features/home/routes/routes.dart';
import 'package:mkan_podcast_new/features/home/screen/bottomNavScreens/Podcast_folder/albumPage.dart';
import 'package:mkan_podcast_new/features/home/screen/bottomNavScreens/Podcast_folder/streamsound.dart';
import 'package:mkan_podcast_new/features/home/screen/home_page.dart';

import '../../features/home/screen/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case HomeRoute.splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    //
      case HomeRoute.homePage:
        return CustomRoutes.slideUp(const HomePage());
    //

      case HomeRoute.albumPage:
        return CustomRoutes.slideUp( AlbumPage());
    //

      case HomeRoute.streamSound:
        return CustomRoutes.slideUp( StreamSound());
    //   case AuthRoutes.signUp2:
    //     var args = settings.arguments as Map;
    //     return CustomRoutes.fadeIn(RegisterStage2(
    //       data: args,
    //     ));
    //
    //   case AuthRoutes.passwordSetup:
    //     var args = settings.arguments as Map;
    //     return CustomRoutes.fadeIn(PasswordPage(
    //       data: args,
    //     ));
    //
    //   case AuthRoutes.initial:
    //     return CustomRoutes.fadeIn(const LoginPage());
    //
    //   case AuthRoutes.verifyAccount:
    //     return CustomRoutes.fadeIn(const WelcomeBackPage());
    //
    //   case AuthRoutes.forgotPassword:
    //     return CustomRoutes.fadeIn(const ForgotPasswordPage());
    //
    //   case AuthRoutes.emailVerificationScreen:
    //     return CustomRoutes.fadeIn(const EmailVerification());
    //
    //   case AuthRoutes.createPin:
    //     var args = settings.arguments as Map;
    //     return CustomRoutes.fadeIn(CreatePin(
    //       registerResponse: args["registerResponse"],
    //     ));

    //   case routeProfileScreen:
    //     return CustomRoutes.fadeIn(const ProfileScreen());
    // // case routeCreateNewPassword:
    // //   return CustomRoutes.slideIn(CreateNewPassword());
    // // case routeVerifyPhone:
    // //   return CustomRoutes.slideIn(VerifyPhone());
    // //
    //   case routeDashboard:
    //     return    MaterialPageRoute(
    //       builder: (_) =>  DashboardPage(),
    //     );
    // // case routeUploadDocument:
    // //   return MaterialPageRoute(
    // //     builder: (_) =>  UploadDocument(),
    // //   );
    //   case routePasscode:
    //     return MaterialPageRoute(
    //       builder: (_) =>  const PasscodePage(),
    //     );
    //
    // case routeResetPassword:
    //   return MaterialPageRoute(
    //     builder: (_) =>  ResetPassowrd(),
    //   );
    // case routeEmailSent:
    //   return MaterialPageRoute(
    //     builder: (_) =>  EmailSent(),
    //   );
    //
    // case routeTrackCustomer:
    //   return MaterialPageRoute(
    //     builder: (_) =>  TrackCustomer(),
    //   );
    //
    //
    // case routeCompletedJob:
    //   return MaterialPageRoute(
    //     builder: (_) =>  CompletedJob(),
    //   );
    //
    // case routeChat:
    //   return MaterialPageRoute(
    //     builder: (_) =>  MessagePage(),
    //   );
    //
    //
    // case routeEvaluateReport:
    //   return MaterialPageRoute(
    //     builder: (_) =>  EvaluationReportPage(),
    //   );
    //
    //
    // case routeEvaluateReport2:
    //   return MaterialPageRoute(
    //     builder: (_) =>  EvaluationReport2Page(),
    //   );
    //
    // case routeStartJob:
    //   return MaterialPageRoute(
    //     builder: (_) =>  StartJob(),
    //   );
    //
    // case routeHome:
    //   return MaterialPageRoute(
    //     builder: (_) =>  Home(),
    //   );
    // case routeNotification:
    //   return CustomRoutes.fadeIn(NotificationPage());
    // case routeChangePassword:
    //   return CustomRoutes.fadeIn(ChangePassword());
    // case routeRequestDetails:
    //   return MaterialPageRoute(
    //     builder: (_) =>  RequestDetails(),
    //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class CustomRoutes {
  static Route fadeIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 5),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.easeInExpo;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route slideIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = const Offset(10, 0);
        var end = Offset.zero;
        var curve = Curves.easeInExpo;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route slideUp(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = const Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }
}