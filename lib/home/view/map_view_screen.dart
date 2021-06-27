
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/active_toggle_button.dart';
import 'package:upstanders/global/widgets/bottom_button.dart';
import 'package:upstanders/global/widgets/custom_marker.dart';
import 'package:upstanders/global/widgets/dialogs.dart';
import 'package:upstanders/global/widgets/map_sample.dart';
import 'package:upstanders/home/view/discreet_alert_description_screen.dart';
import 'package:upstanders/home/view/enter_pin_screen.dart';
import 'package:upstanders/home/view/helper3_screen.dart';
import 'package:upstanders/home/view/map_view_screen2.dart';
import 'package:upstanders/home/view/urgent_alert_description_screen.dart';
import 'package:upstanders/settings/view/acronyms_screen.dart';
import 'package:upstanders/settings/view/recordings_screen.dart';
import 'package:upstanders/settings/view/view.dart';
import 'package:upstanders/videos/view/video_streaming_screen2.dart';
import 'package:upstanders/videos/view/view.dart';

import '../../main.dart';

class MapViewScreen extends StatefulWidget {
  @override
  _MapViewScreenState createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


//  MapController controller;
  
  ValueNotifier<bool> zoomNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> advPickerNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> trackingNotifier = ValueNotifier(false);
  bool isActive = false;
  LocalDataHelper localDataHelper =LocalDataHelper();

  @override
  void initState() {
    super.initState();

   
  }


  // map(){
  //    controller = MapController(
  //     initMapWithUserPosition: false,
  //     initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  //   );
  //   _scaffoldKey = GlobalKey<ScaffoldState>();
   
  //   Future.delayed(Duration(seconds: 10),()async{
  //     await controller.zoom(5);
  //     await controller.rotateMapCamera(45.0);
     
  //   });
  // }

  // // @override
  // // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      // endDrawer: BuildDrawer(),
      drawer: BuildDrawer(),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            children: [
              
              SampleMap(),
              Align(
                alignment: Alignment.bottomCenter,
                child: _bottomRowButton()
              ),
              
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                  child: IconButton(
                      icon: Image.asset("assets/icons/sideBar.png"),
                      onPressed: () {
                        print("open drawer");
                        _scaffoldKey.currentState.openDrawer();
                      }),
                ),
              ),
              isActive ?ActiveToggleButton(
                onChange :(){
                  setState(() {
                     isActive = false;
                     
                   });
                }
              ):InActiveToggleButton(
                 onChange :(){
                    setState(() {
                      isActive = true;
                      
                    });
                  
                   showGeneralDialog(
                        barrierLabel: "Barrier",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 700),
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return Align(
                              alignment: Alignment.center,
                              child:
                              ActiveInactiveDialogBox(
                                onCancel: (){
                                  Navigator.of(context).pop();
                                },
                                onContinue: (){
                                  
                                  Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => VideosStreamingScreen()));

                                },
                              )
                              

                          );
                        },
                        transitionBuilder: (_, anim, __, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                            child: child,
                          );
                        },
                      );
                 }
              )
              
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
      floatingActionButton: Align(
        alignment: Alignment(1, 0.8),
          child: InkWell(
          onTap: (){

            showGeneralDialog(
          barrierLabel: "Barrier",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: Duration(milliseconds: 700),
          context: context,
          pageBuilder: (_, __, ___) {
            return Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 30,),
                  child: NotificationDialogBox(
                    onHangUp: (){},
                    onRecieve: (){},
                  ),
                )
                

            );
          },
          transitionBuilder: (_, anim, __, child) {
            return SlideTransition(
              position:
                  Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim),
              child: child,
            );
          },
        );

           
            

          },
          child:
           Image.asset("assets/icons/loc.png", 
            height:45, width:45)
        ),
      ),
    );
  }

  // _map(BaseMapController controller, BuildContext context){
  //   return OSMFlutter(
  //     controller: controller,
  //     //trackMyPosition: trackingNotifier.value,
  //     useSecureURL: false,
  //     showDefaultInfoWindow: false,
  //     defaultZoom: 3.0,

  //     onLocationChanged: (myLocation) {
  //       print(myLocation);
  //     },
  //     onGeoPointClicked: (geoPoint) async {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             "${geoPoint.toMap().toString()}",
  //           ),
  //           action: SnackBarAction(
  //             onPressed: () => ScaffoldMessenger.of(context)
  //                 .hideCurrentSnackBar(),
  //             label: "hide",
  //           ),
  //         ),
  //       );
  //     },
  //     staticPoints: [
  //       StaticPositionGeoPoint(
  //         "line 1",
  //         MarkerIcon(
  //           icon: Icon(
  //             Icons.train,
  //             color: Colors.green,
  //             size: 48,
  //           ),
  //         ),
  //         [
  //           GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
  //           GeoPoint(latitude: 47.4317782, longitude: 8.4716146),
  //         ],
  //       ),
  //       StaticPositionGeoPoint(
  //         "line 2",
  //         MarkerIcon(
  //           icon: Icon(
  //             Icons.train,
  //             color: Colors.red,
  //             size: 48,
  //           ),
  //         ),
  //         [
  //           GeoPoint(latitude: 47.4433594, longitude: 8.4680184),
  //           GeoPoint(latitude: 47.4517782, longitude: 8.4716146),
  //         ],
  //       )
  //     ],
  //     road: Road(
  //       startIcon: MarkerIcon(
  //         icon: Icon(
  //           Icons.person,
  //           size: 64,
  //           color: Colors.brown,
  //         ),
  //       ),
  //       roadColor: Colors.red,
  //     ),
  //     markerIcon: MarkerIcon(
  //       icon: Icon(
  //         Icons.home,
  //         color: Colors.orange,
  //         size: 64,
  //       ),
  //     ),
  //   );
  // }

  _bottomRowButton(){
    return Container(
      height: 55,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                showGeneralDialog(
                        barrierLabel: "Barrier",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 700),
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return Align(
                              alignment: Alignment.center,
                              child:
                              IllAndIcantDialogBox(
                                title: "DISCREET",
                                gradient :LinearGradient(
                                  colors: [MyTheme.discreetAlertGradientUp, MyTheme.discreetAlertGradientDown],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                                ),
                               icant: () { 
                                  Navigator.of(context).pop();

                                 }, 
                                illgo: () {  
                                   Navigator.of(context).push(
                                   MaterialPageRoute(builder: (context) => DiscreetAlertDescriptionScreen(
                                     backButton: Container(),
                                     bottomButton:   BottomButton(onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => MapViewScreen2(),
                                          ),
                                        );
                                      }),
                                   )));
                                 },)
                              

                          );
                        },
                        transitionBuilder: (_, anim, __, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                            child: child,
                          );
                        },
                      );
                
              },
                child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(30),
                    
                  // ),
                  gradient: LinearGradient(
                     colors: [MyTheme.discreetAlertGradientUp, MyTheme.discreetAlertGradientDown],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    
                  )
                ),
                child:  Text(
                  "DISCREET",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.secondryColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                showGeneralDialog(
                        barrierLabel: "Barrier",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 700),
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return Align(
                              alignment: Alignment.center,
                              child:
                              IllAndIcantDialogBox(
                                
                                title: "URGENT",
                                icant: () { 
                                  Navigator.of(context).pop();

                                 }, 
                                illgo: () {  
                                   Navigator.of(context).push(
                                   MaterialPageRoute(builder: (context) => UrgentAlertDescriptionScreen(
                                     backButton: Container(),
                                     bottomButton:   BottomButton(onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => MapViewScreen2(),
                                          ),
                                        );
                                      }),
                                   )));
                                  //  Helper3Screen()
                                 },
                                 gradient :LinearGradient(
                                  colors: [  MyTheme.urgentAlertGradientUp,MyTheme.urgentAlertGradientDown,], //red400
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                                ),)
                              

                          );
                        },
                        transitionBuilder: (_, anim, __, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                            child: child,
                          );
                        },
                      );
                 },
                child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: MyTheme.red,
                  // borderRadius: BorderRadius.only(
                    
                  //   bottomRight: Radius.circular(30),
                  // )

                   gradient: LinearGradient(
                    // colors: [ MyTheme.red, MyTheme.red300,],
                     colors: [  MyTheme.urgentAlertGradientUp,MyTheme.urgentAlertGradientDown,],
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter
                    
                  )
                  
                ),
                child:  Text(
                  "URGENT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.secondryColor),
                ),
              ),
            ),
          ),


      ],),
    );
  }
}

class InActiveToggleButton extends StatelessWidget {
  final void Function()onChange;

  const InActiveToggleButton({Key key, this.onChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:InkWell(
                    onTap: onChange,
                    child: Container(
                      // padding: const EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      height: size.height * 0.06,
                      width: size.width * 0.34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                         color: MyTheme.white,
                        border: Border.all(color:MyTheme.primaryColor, width: 3)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: MyTheme.white,
                                border: Border.all(color:MyTheme.primaryColor, width: 3)),
                                child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyTheme.primaryColor,
                                 
                                   )
                              ),
                          ),
                         
                          Text("INACTIVE",
                            style: TextStyle(
                                color: MyTheme.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))

                        ],
                      ),
                    ),
                  )
                ),
              );
  }
}



class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
   
    return Container(
    //  width:size.width * 0.7 ,
      child: Drawer(
          elevation: 20.0,
          child: Container(
            color: MyTheme.primaryColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  height: size.height * 0.1,
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //      SizedBox(height: size.height * 0.02),
                  //      ProfileAvatar(
                  //       avatarRadius: avatarRadius, 
                  //       width:avatarRadius +30 ,
                  //       imageUrl: 'https://wallpaperaccess.com/full/3957694.jpg',

                  //     ),

                  //     SizedBox(height: size.height * 0.02),
                  //     Text(
                  //       "Crystal Gaskell",
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //           color: MyTheme.black),
                  //     ),

                  //   ],

                  // ),
                  
                ),
               
                ListTile(
                  leading:  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),), 
                    child: Image.asset("assets/icons/profile.png",
                   height: 30, width: 30,)),
                  title: Text(
                    "Account & Profile",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.black),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AccountProfileScreen()));
                    
                    // Navigator.pop(context);
                  },
                ),
               
                ListTile(
                  leading:  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),), 
                    child: Image.asset("assets/icons/videos.png",
                   height: 30, width: 30,)),
                  title: Text(
                    "Training videos",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.black),
                  ),
                  onTap: () {
                     Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => VideosStreamingScreen2()));
                    
                    // Navigator.pop(context);
                  },
                ),
               
                ListTile(
                  leading:  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),), 
                    child: Image.asset("assets/icons/acronyms.png",
                   height: 30, width: 30,)),
                  title: Text(
                    "Training summary",
                    // "Acronyms",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.black),
                  ),
                  onTap: () {
                     Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AcronymsScreen()));
                    
                    // Navigator.pop(context);
                  },
                ),
               
                ListTile(
                  leading:  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),), 
                    child: Image.asset("assets/icons/reportAlert.png",
                   height: 30, width: 30,)),
                  title: Text(
                    "Report from past alerts",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.black),
                  ),
                  onTap: () {
                     Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EnterPinCodeScreen()));
                    
                    // Navigator.pop(context);
                  },
                ),


                ListTile(
                  leading:  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),), 
                    child: Image.asset("assets/icons/recordings.png",
                   height: 30, width: 30,)),
                  title: Text(
                    "Recording from past alerts",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.black),
                  ),
                  onTap: () {
                      Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RecordingsScreen()));
                    
                    
                     
                  },
                ),


                
                ListTile(
                  leading:  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),), 
                    child: Image.asset("assets/icons/logout.png",
                    height: 30, width: 30,)),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.black),
                  ),
                  onTap: () {
                    showGeneralDialog(
                        barrierLabel: "Barrier",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 700),
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return Align(
                              alignment: Alignment.center,
                              child:
                              LogoutDialogBox(
                                onCancel:(){},
                                onLogout:() {},)
                              

                          );
                        });
                    
                    // Navigator.pop(context);
                  },
                )
              ],
            ),
          )),
    );
  }
}
