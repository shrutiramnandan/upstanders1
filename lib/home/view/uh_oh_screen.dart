import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/home/view/view.dart';

class UHOHScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _BG(),
          _Foreground(),
          // 
        ],
      ),
      bottomNavigationBar:_BottomButton(
        onTap: (){
          Navigator.pop(context,true);
          //  Navigator.of(context).pop();
          //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          //           builder: (context) => MapViewScreen()), (routes)=>false); //VideosStreamingScreen
        }
      )
      
    );
    
  }
}

class _BG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/UHOH.png"),
          fit: BoxFit.fill
        )
      ),
      
    );
  }
}

class _Foreground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "UH-OH..",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.black),
            ),
            SizedBox(height: size.height * 0.03,),

            Text(
              "You've answered some questions\nwrongly. Give it another shot!",
               textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.black),
            ),

          ],
        ),
      ),
      
    );
  }
}

class _BottomButton extends StatelessWidget {
  final void Function() onTap;

  const _BottomButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height:size.height * 0.08,
          color: MyTheme.primaryColor,
          child:  Text(
            "WATCH AGAIN",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyTheme.black),
          ),

        ),
      ) ;
  }
}