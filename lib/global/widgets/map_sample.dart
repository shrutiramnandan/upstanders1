
import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:upstanders/global/constants/keys.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/custom_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:upstanders/global/widgets/ripple_animation.dart';

import '../../main.dart';

class SampleMap extends StatefulWidget {
  @override
  _SampleMapState createState() => _SampleMapState();
}

class _SampleMapState extends State<SampleMap> {
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
    getloc();
  }

 Future<Position> getloc()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("position position position:$position");
    return position;
  }


 Future<Location>  getUpdateLocation()async{
   Location upDatedLocation;
     BackgroundLocation.getLocationUpdates((location) {
    upDatedLocation = location ;
       
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
    return upDatedLocation;
  }
  @override
  Widget build(BuildContext context) {
    return   
      FutureBuilder(
        future:
        //  getUpdateLocation(),
        getloc(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          Position position = snapshot.data;
          // Location position = snapshot.data;

          return FlutterMap(
          
              options: MapOptions(
                
                onLongPress: (latlong){
                  print("onLongPress latlong$latlong");
                },
                onPositionChanged: (mapPosition, val){
                },
                onTap:  (latlong){
                  print("onTap latlong$latlong");
                },
                // bounds: LatLngBounds(),
                center: LatLng(position.latitude,position.longitude ),
                // LatLng(40.730610, -73.935242),    
                zoom: 15,
              ),
              layers: [
                TileLayerOptions(
            urlTemplate:
             'https://api.mapbox.com/styles/v1/manjeetkmr18/ckowk5f3d0npf18k8gtuf67uk/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
                // 'https://api.mapbox.com/styles/v1/manjeetkmr18/ckowk5f3d0npf18k8gtuf67uk/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
              'id': 'mapbox.mapbox-streets-v8'
            },
            tileProvider: NonCachingNetworkTileProvider(),
          ),
                MarkerLayerOptions(
                  markers: [
                    // Marker(
                    //   width: 40.0,
                    //   height: 40.0,
                    //   point: LatLng(position.latitude,position.longitude),
                    //   // (40.732342, -73.935435),
                    //   builder: (ctx) =>CustomMarker(
                    //         avatarRadius: 30,
                    //         imageUrl: "assets/users/DavidElks.png",
                    //         bgColor2: MyTheme.secondryColor,
                    //         bgColor1:  MyTheme.primaryColor,
                    //       )
                      
                    // ),
                    

                    //  Marker(
                    //   width: 90.0,
                    //   height: 90.0,
                    //   point: LatLng(30.702579504146534, 76.7033067007403),
                    
                    //   builder: (ctx) =>
                    //   BuildCustomMarker(
                    //     userName: 'Ashley Judds',
                    //     userImage: 'assets/users/AshleyJudd.png',
                    //     size: 80,
                    //     userSize :40,
                    //     color: MyTheme.primaryColor,
                    //     onPressed: (){},
                    //   ),
                      
                      
                      
                    // ),
                    

                    Marker(
                      width: 90.0,
                      height: 90.0,
                      point: LatLng(30.70698670093554, 76.70888880227865),
                      // (40.732342, -73.935435),
                      builder: (ctx) =>
                      BuildCustomMarker(
                         userName: 'Alan Post',
                        userImage: 'assets/users/AlanPost.png',
                        size: 80,
                        userSize :40,
                        color: MyTheme.primaryColor,
                        onPressed: (){},
                      ),
                      // PeerCustomMarker(
                      //       avatarRadius: 20,
                      //       imageUrl: "assets/users/DavidElks.png",
                      //       bgColor1: Color(0xffFFC938).withOpacity(0.7),
                      //       bgColor2: MyTheme.primaryColor,
                           
                      //     )
                      
                    ),

                    Marker(
                      width: 90.0,
                      height: 90.0,
                      point: LatLng(30.696376, 76.700028),
                      // (40.732342, -73.935435),
                      builder: (ctx) =>
                      BuildCustomMarker(
                         userName: 'Ashley Judd',
                        userImage: 'assets/users/AshleyJudd.png',
                        size: 80,
                        userSize :40,
                        color: MyTheme.primaryColor,
                        onPressed: (){},
                      ),
                      // PeerCustomMarker(
                      //       avatarRadius: 20,
                      //       imageUrl: "assets/users/DavidElks.png",
                      //       bgColor1: Color(0xffFFC938).withOpacity(0.7),
                      //       bgColor2: MyTheme.primaryColor,
                           
                      //     )
                      
                    ),

                    Marker(
                      width: 90.0,
                      height: 90.0,
                      point: LatLng(30.70244464316716, 76.69509738045028),
                      // (40.732342, -73.935435),
                      builder: (ctx) =>
                      BuildCustomMarker(
                         userName: 'David Elks',
                        userImage: 'assets/users/DavidElks.png',
                        size: 80,
                        userSize :40,
                        color: MyTheme.primaryColor,
                        onPressed: (){},
                      ),
                      // PeerCustomMarker(
                      //       avatarRadius: 20,
                      //       imageUrl: "assets/users/DavidElks.png",
                      //       bgColor1: Color(0xffFFC938).withOpacity(0.7),
                      //       bgColor2: MyTheme.primaryColor,
                           
                      //     )
                      
                    ),
                    
                   

                    Marker(
                      width: 90.0,
                      height: 90.0,
                      point: LatLng(30.699736043070946, 76.69189672602559),
                      // (40.732342, -73.935435),
                      builder: (ctx) =>
                      BuildCustomMarker(
                         userName: 'Rohit Shah',
                        userImage: 'assets/users/RohitShah.png',
                        size: 80,
                        userSize :40,
                        color: MyTheme.primaryColor,
                        onPressed: (){},
                      ),
                      // PeerCustomMarker(
                      //       avatarRadius: 20,
                      //       imageUrl: "assets/users/DavidElks.png",
                      //       bgColor1: Color(0xffFFC938).withOpacity(0.7),
                      //       bgColor2: MyTheme.primaryColor,
                           
                      //     )
                      
                    ),


                    Marker(
                      width: 90.0,
                      height: 90.0,
                      point: LatLng(30.71041898120244, 76.69725050592257),
                      // (40.732342, -73.935435),
                      builder: (ctx) =>BuildCustomMarker(
                        userName: 'Winnie Lu',
                        userImage: 'assets/users/WinnieLu.png',
                        size: 80,
                        userSize :40,
                        color: MyTheme.primaryColor,
                        onPressed: (){},
                      ),
                      
                    ),

                     Marker(
                      width: 200.0,
                      height: 200.0,
                      point: LatLng(position.latitude,position.longitude),
                      // 30.710992, 76.704537
                      builder: (ctx) =>RipplesAnimation(
                        //  userName: 'Alice Woods',
                        userImage: 'assets/users/CrystalGaskell.png',
                        size: 100,
                        userSize :60,
                        color: MyTheme.red400,
                        onPressed: (){},
                      ),
                      
                    ),




                    //animation

                    

                    

                    

                    
                  ],
                ),
                // MarkerLayerOptions(markers: markers)
              ],
            );
        }
      );
      
   
  }
}

