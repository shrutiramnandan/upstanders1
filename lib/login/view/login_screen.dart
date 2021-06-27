import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/home/view/view.dart';
import 'package:upstanders/login/bloc/login_bloc.dart';
import 'package:upstanders/login/repository/authentication_repository.dart';
import 'package:upstanders/login/view/view.dart';
import 'package:upstanders/register/bloc/signup_bloc.dart';
import 'package:upstanders/register/constants/my_strings.dart';
import 'package:upstanders/register/view/view.dart';
import 'package:upstanders/register/widgets/widgets.dart';
import 'package:formz/formz.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.secondryColor,
      body: Column(
      children: [
        SizedBox(height: size.height * 0.1),
        _LoginLogo(),
       _LoginFormScreen()
        // InputForm()
       
      ],
    ),
    );
  }



  
}

class _LoginLogo extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.2,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: MyTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
        image:DecorationImage(
            image:  AssetImage("assets/images/logo.png")
          )
      ),
    );
  }
}


class _LoginFormScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginBloc(
          // authenticationRepository:
          //     RepositoryProvider.of<AuthenticationRepository>(context),
        );
      },
      child:  BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if(state.status.isSubmissionSuccess){
              Fluttertoast.showToast(
                  msg: "User loggedIn Successfully",
                 
              );
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context)=>MapViewScreen()), (route) => false);

            }
            if(state.status.isSubmissionFailure){
              Fluttertoast.showToast(
                  msg: "Something went wrong",
                 
              );
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context)=>MapViewScreen()), (route) => false);

            }

            // switch (state.status) { 
            //   case AuthenticationStatus.authenticated:
            //    Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
            //     break;
            //   case AuthenticationStatus.unauthenticated:
            //     _navigator.pushAndRemoveUntil<void>(
            //       LoginPage.route(),
            //       (route) => false,
            //     );
            //     break;
            //   default:
            //     break;
            // }
          },
          child: InputForm(),
        )
      // InputForm(),
    );
  }
}

