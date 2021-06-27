
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/dialogs.dart';
import 'package:upstanders/global/widgets/map_sample.dart';
import 'package:upstanders/global/widgets/user_avatar.dart';
import 'package:upstanders/home/view/enter_pin_screen.dart';
import 'package:upstanders/home/view/report_screen.dart';
import 'package:upstanders/main.dart';

class MapViewScreen2 extends StatefulWidget {
  @override
  _MapViewScreen2State createState() => _MapViewScreen2State();
}

class _MapViewScreen2State extends State<MapViewScreen2> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLeaveAlert = true;


//  MapController controller;
   GlobalKey<ScaffoldState> _scaffoldKey;
  ValueNotifier<bool> zoomNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> advPickerNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> trackingNotifier = ValueNotifier(false);

  // @override
  // void initState() {
  //   super.initState();
  //   controller = MapController(
  //     initMapWithUserPosition: false,
  //     initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  //   );
  //   _scaffoldKey = GlobalKey<ScaffoldState>();
   
  //   Future.delayed(Duration(seconds: 10),()async{
  //     await controller.zoom(5);
  //     await controller.rotateMapCamera(45.0);
     
  //   });
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            children: [
             
              SampleMap(),
             

            ],
          ),
        ),
      ),
      
      floatingActionButton: Align(
        alignment: Alignment(1,0.5),
        child: Container(
          height: 100,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                },
                child: Image.asset("assets/icons/loc.png", 
                  height:45, width:45)
              ),
              SizedBox(height:10),
              InkWell(
                onTap: (){
                },
                child: Image.asset("assets/icons/direction.png", 
                  height:40, width:40)
              ),
            ],
          ),
        )
      ),
      bottomSheet:  _bottomButton2(size)
     
    );
  }

 
  _bottomButton2(Size size){
    return Container(
       height: size.height *0.2, 
       color: MyTheme.primaryColor,
       padding: const EdgeInsets.all(5),
       child: Column(
         children: [
          ListTile(
            leading: UserAvatarAsset(
              asset: "assets/users/CrystalGaskell.png", 
              avatarRadius: 45),
            title: Text("CRYSTAL GASKELL", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
            trailing: InkWell(
              onTap: (){
                 
              },
              child: Image.asset("assets/icons/chat.png", height:40, width:40)),
          ),
          // SizedBox(height:10),
          
          ListTile(
           
            title: Text("3 min (200m away)", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            subtitle:Text("Fastest Route Now", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: MyTheme.secondryColor
            ),),
            trailing: InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MapViewScreen3()));

              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 90,
                decoration: BoxDecoration(
                  color: MyTheme.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/navigate.png", height: 20, width: 20,),
                    SizedBox(width:8),
                    Text("START", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: MyTheme.secondryColor
                    ),),

                  ],
                ),
              ),
            ),
          ),
         ],
       ),

    );

  }


}












class MapViewScreen3 extends StatefulWidget {
  @override
  _MapViewScreen3State createState() => _MapViewScreen3State();
}

class _MapViewScreen3State extends State< MapViewScreen3> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLeaveAlert = true;


//  MapController controller;
   GlobalKey<ScaffoldState> _scaffoldKey;
  ValueNotifier<bool> zoomNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> advPickerNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> trackingNotifier = ValueNotifier(false);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      // endDrawer: BuildDrawer(),
      // drawer: BuildDrawer(),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            children: [
             
              SampleMap(),
              

            ],
          ),
        ),
      ),
      
      floatingActionButton: Align(
        alignment: Alignment(1,0.8),
              child: InkWell(
          onTap: (){
          },
          child: Image.asset("assets/icons/loc.png", 
            height:45, width:45)
        ),
      ),
      bottomSheet:  
      isLeaveAlert? _bottomButton(
        size,
        "LEAVE ALERT",
        (){
          setState(() {
            isLeaveAlert = false;
          });

        }
        
      )
      :_bottomButton(
        size,
        "END ALERT",
        (){
          setState(() {
            isLeaveAlert = true;
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
                 
                  
                  EndedAlertDialogBox(onContinue: () { 
                    Navigator.of(context).pop();

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
        }
        
      ),
    );
  }

  

  _bottomButton(Size size, String title,void Function() onTap){
    return RoundedBorderTextButton(
      title: title,
       onTap: onTap, 
       height: size.height *0.08, 
       width: size.width, 
       textColor: MyTheme.black, 
       bgColor: MyTheme.primaryColor, 
       borderRadius: 0, 
       fontSize: 20,
       borderColor: MyTheme.primaryColor);
   
  }

  


}


