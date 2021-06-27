import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:upstanders/api/constants_api.dart';
import 'dart:convert';

import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/register/models/create_account.dart';

class Apis{
   LocalDataHelper  localDataHelper = LocalDataHelper();

  Future<dynamic> login({@required String email,@required String pin, })async{
    
    try{
      var url = Uri.parse("$BASE_URL/login");
      var response = await http.post(url, body: {'email': email, 'pin': pin});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
       Map res = json.decode(response.body);
       
      return res;
       
    }catch(e){
      print("Thrown Exception While signing IN:$e");
      throw e;

    }
  }


  Future<dynamic> signup({@required String email,@required String pin, })async{
    
    try{
      var url = Uri.parse("$BASE_URL/signup");
      var response = await http.post(url, body: {'email': email, 'pin': pin});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);
    
   
     return res;
    }catch(e){
      print("Thrown Exception While signing Up:$e");
      throw e;

    }
  }

  Future<dynamic> sendOTP({@required CreateAccount createAccount})async{
    var token = await localDataHelper.getStringValue(key: 'token');

    print("TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");

    
    try{ //createAccount.token
      var url = Uri.parse("$BASE_URL/send-otp");
      var response = await http.post(url,
       headers:{
          "Authorization":"$token" 
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);
     
   
     return res;
    }catch(e){
      print("Thrown Exception SENDING OTP:$e");
      throw e;

    }
  }

  Future<dynamic> verifyOTP({@required CreateAccount createAccount})async{
     var token = await localDataHelper.getStringValue(key: 'token');
     var otp = await localDataHelper.getStringValue(key: 'otp');

    print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
    print("verifyOTP OTPPPPPPPPPPPPP:$otp");

    
    try{
      var url = Uri.parse("$BASE_URL/verify-otp");
      var response = await http.post(url,
       headers:{
          "Authorization":"$token"
        },
        body: {"otp":"$otp"}
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);
     
   
     return res;
    }catch(e){
      print("Thrown Exception Verifying OTP:$e");
      throw e;

    }
  }


  Future<dynamic> createAccount({@required CreateAccount  createAccount})async{
    
    try{
      var url = Uri.parse("$BASE_URL//update-profile");
      var response = await http.post(
        url, 
        headers:{
          'Content-type': 'application/json',
          "Authorization":"${createAccount.token}"
        },
        body: createAccount.toJson());
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);
    
   
     return res;
    }catch(e){
      print("Thrown Exception While updating profile :$e");
      throw e;

    }
  }


}

// {
//     "status": 200,
//     "data": {
//         "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo1LCJpYXQiOjE2MjQyNTc0NDd9.aSP_cszVU_bRtsuyQvqE3V89Fm3p8CWPnpwa6LMB6uo"
//     },
//     "message": "Account created successfully ."
// }

// url : 52.14.21.106:3000/api/v1/send-otp
// method : post 
// params : none 

// url : 52.14.21.106:3000/api/v1/verify-otp
// mthod : post 
// params : otp 






// url : 52.14.21.106:3000/api/v1/update-user-location
// method : post 
// params : { 
//     "latitude":53.2734, 
//     "longitude":-7.77832031
// }





// url : 52.14.21.106:3000/api/v1/update-profile
// method : post 
// params : first_name, last_name,  dob , gender , country_code , phone , image , license_image , latitude , longitude , fcm_token , pin , otp , account_status ,online_status