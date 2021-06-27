import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/pop_button.dart';

class VideosStreamingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        backgroundColor: MyTheme.secondryColor,
        body: _VideosForm());
  }
}

class _VideosForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Video(),
              SizedBox(height: size.height * 0.01),
              Text(" More Videos", style: TextStyle(
                   fontWeight: FontWeight.bold,
                    fontSize: 14,
                color: MyTheme.white)),
              SizedBox(height: size.height * 0.01),
              Videos(),
              SizedBox(height: size.height * 0.01),
               Text(" More Videos", style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 14,
                 color: MyTheme.white)),
              SizedBox(height: size.height * 0.01),
              Videos(),
             
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: RoundedBorderTextButton(
          //     fontSize: 18,
          //     title: "NEXT",
          //     height: size.height * 0.08,
          //     width: size.width,
          //     bgColor: MyTheme.primaryColor,
          //     textColor: MyTheme.secondryColor,
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => RightOnScreen()));
          //     },
          //     borderColor: MyTheme.primaryColor,
          //     borderRadius: 0,
          //   ),
          // )
        ],
      ),
    );
  }
}

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: MyTheme.white,
        alignment: Alignment.center,
        height: size.height * 0.38,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
                height: size.height * 0.15,
                width: size.width * 0.32,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: MyTheme.black38,
              height: size.height * 0.38,
              width: size.width,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: MyTheme.primaryColor),
                  child: Icon(
                    Icons.play_arrow,
                    size: 40,
                    color: MyTheme.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: () {}, 
                child: Image.asset("assets/icons/fullScreen.png",height: 25,width: 25, )),
              ),
            ),
            PopButton()
          ],
        ));
  }
}

class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.22,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.only(right: 10),
                color: MyTheme.white,
                alignment: Alignment.center,
                height: size.height * 0.30,
                width: size.width * 0.6,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: MyTheme.black38,
                      height: size.height * 0.30,
                      width: size.width,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyTheme.primaryColor),
                          child: Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: MyTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          }),
    );
  }
}
