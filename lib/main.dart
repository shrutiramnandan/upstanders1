import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:upstanders/chat/groupChat/view/start_group_chat_screen.dart';
import 'package:upstanders/global/model/mcq.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/circle_painter.dart';
import 'package:upstanders/global/widgets/number_keypad.dart';
import 'package:upstanders/global/widgets/profile_avatar.dart';
import 'package:upstanders/global/widgets/ripple_animation.dart';
import 'package:upstanders/global/widgets/user_avatar.dart';
import 'package:upstanders/home/view/enter_pin_screen.dart';
import 'package:upstanders/quiz/start_quiz.dart';
import 'package:upstanders/settings/view/app_permission_screen.dart';
import 'package:upstanders/splash/view/view.dart';
import 'package:upstanders/videos/view/video_playing.dart';
import 'package:video_player/video_player.dart';
import 'dart:math'as math;
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:background_fetch/background_fetch.dart';


import 'dart:convert';

// import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;
// import 'package:mlkit/mlkit.dart';




import 'global/widgets/dialogs.dart';
import 'home/view/map_view_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:background_location/background_location.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter_genius_scan/flutter_genius_scan.dart';

// import 'package:open_file/open_file.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  
    // await Firebase.initializeApp();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
       DeviceOrientation.portraitDown
    ]);
    
   SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: MyTheme.primaryColor));
  runApp(MyApp());
  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

final theme = ThemeData(
  textTheme: GoogleFonts.karlaTextTheme(),
  primaryColor: MyTheme.primaryColor,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upstanders',
      theme: theme,
      home: 
      // FacePage(),
      SplashScreen(),
      // VideoList()
      // StartQuizScreen()
      // BeginQuizScreen()
      // MyHomePage(),
      // NormalPlayerPage()
      // BackLoc()
      // BackFetch()
      // MyScaffoldBody(),
      
      localeListResolutionCallback: (locales, supportedLocales) {

        print('device locales=$locales supported locales=$supportedLocales');

        for (Locale locale in locales) {
          // if device language is supported by the app,
          // just return it to set it as current app language
          if (supportedLocales.contains(locale)) {
              return locale;
          }
        }

        // if device language is not supported by the app,
        // the app will set it to english but return this to set to Bahasa instead
        return Locale('en', 'US');
        // Locale('id', 'ID');
    },

    supportedLocales:[ Locale('en', 'US'),],
    //  [Locale('id', 'ID'), Locale('en', 'US')],
    locale: Locale('en', 'US'),
     
    );
  }
}

