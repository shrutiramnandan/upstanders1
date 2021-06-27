import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/home/view/view.dart';
import 'package:upstanders/register/view/onboarding_screen.dart';

import '../../main.dart';

class FaceRecognitionScreen extends StatefulWidget {
   final CameraDescription camera;

  const FaceRecognitionScreen({Key key, this.camera}) : super(key: key);
  @override
  _FaceRecognitionScreenState createState() => _FaceRecognitionScreenState();
}

class _FaceRecognitionScreenState extends State<FaceRecognitionScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
     appBar:AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon:Image.asset("assets/icons/cross.png", height: 20, width: 20,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "TAKE FRONT SIDE PHOTO",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ],
          )),
      body:  Container(
        height: size.height ,
        width: size.width,
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(_controller);
            } else {
              // Otherwise, display a loading indicator.
              return Center(
                  child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomSheet: Container(
        color: MyTheme.primaryColor,
        alignment: Alignment.center,
        height: size.height * 0.15,
        child: InkWell(
           onTap: (){
           Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MapViewScreen()));
        },
          child: Image.asset("assets/icons/clickPicture.png", height:60, width:60)),
    ),

    );
  }
}