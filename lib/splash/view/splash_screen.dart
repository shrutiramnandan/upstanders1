import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/home/view/view.dart';
import 'package:upstanders/login/view/view.dart';
import 'package:upstanders/register/view/onboarding_screen.dart';
import 'package:upstanders/register/view/view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String _heading = "Standing up as a community\nagainst sexual violence";
  LocalDataHelper localDataHelper = LocalDataHelper();
   String latitude = 'waiting...';
  String longitude = 'waiting...';
  String altitude = 'waiting...';
  String accuracy = 'waiting...';
  String bearing = 'waiting...';
  String speed = 'waiting...';
  String time = 'waiting...';
  


  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
    localDataHelper.saveValue(key: "IsActive",value:false);
    onBackgroundLocationUpdation();
    
  }

  navigateToNextScreen(){
    Future.delayed(Duration(seconds: 3), ()async{
      String token = await localDataHelper.getStringValue(key: "token");
      print("tokennnnnnnnnnnn :$token");
       Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>OnboardingScreen()),
         (route) => false);
      // if(token!=null && token!=''){
      //   print("token token token token :$token");
      //   Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(builder: (context)=>MapViewScreen()),
      //    (route) => false);

      // }else{
      //   Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(builder: (context)=>OnboardingScreen()),
      //    (route) => false);
      // }
       
      
     
    });
  }

  onBackgroundLocationUpdation()async{
     await BackgroundLocation.setAndroidNotification(
      title: 'Background service is running',
      message: 'Background location in progress',
      icon: '@mipmap/ic_launcher',
    );
    //await BackgroundLocation.setAndroidConfiguration(1000);
    await BackgroundLocation.startLocationService(
        distanceFilter: 20);
    BackgroundLocation.getLocationUpdates((location) {
      setState(() {
        latitude = location.latitude.toString();
        longitude = location.longitude.toString();
        accuracy = location.accuracy.toString();
        altitude = location.altitude.toString();
        bearing = location.bearing.toString();
        speed = location.speed.toString();
        time = DateTime.fromMillisecondsSinceEpoch(
                location.time.toInt())
            .toString();
      });
      print('''\n
        Latitude:  $latitude
        Longitude: $longitude
        Altitude: $altitude
        Accuracy: $accuracy
        Bearing:  $bearing
        Speed: $speed
        Time: $time
      ''');
    });

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: MyTheme.primaryColor,
      body: Stack(
        children: [
         Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image:  AssetImage("assets/images/splashBG.png"),
                fit: BoxFit.cover
              )
            
            ),
          ),

          Container(
            alignment: Alignment.center,
            child:Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:size.height * 0.25),
                
                Center(
                  child: Card( // with Card
                   color: MyTheme.transparent,
                    child: Image.asset("assets/images/logo.png",
                     height: size.height * 0.25,
                     width: size.width * 0.5,
                  
                    ),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    ),
                    clipBehavior: Clip.antiAlias,

                  ),
                ),
                SizedBox(height:15),
                Text(_heading,
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor,
                    fontSize: 18
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}